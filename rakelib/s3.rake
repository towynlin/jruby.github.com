def manifest_xml(stream = File.new('s3manifest.xml'))
  require 'rexml/document'
  @doc ||= REXML::Document.new(stream)
end

def manifest_entries
  manifest_xml.root.elements.to_a('/ListBucketResult/Contents/Key')
end

def sorted_manifest_directories
  entries = manifest_entries.map do |el|
    el.text.strip.sub(/_\$folder\$$/, '/')
  end
  dirs = {"." => []}
  entries.sort.each do |f|
    dirs[File.dirname(f)] ||= []
    dirs[File.dirname(f)] << f
  end
  dirs
end

def write_index_html(html, dir, entries)
  html.puts <<HDR
---
layout: main
title: Files/#{dir == '.' ? '' : dir}
---
<h1>Files/#{dir == '.' ? '' : dir}</h1>
<p class="trackDownloads">
HDR
  parent = File.dirname(dir)
  parent = parent == '.' ? '' : "#{parent}/"
  html.puts "  <a href='/files/#{parent}index.html'>..</a><br/>" unless dir == '.'
  entries.sort.each do |entry|
    if entry =~ /\/$/
      html.puts "  <a href='/files/#{entry}index.html'>#{File.basename(entry)}</a><br/>"
    else
      html.puts "  <a href='http://jruby.org.s3.amazonaws.com/#{entry}'>#{File.basename(entry)}</a><br/>"
    end
  end
  html.puts "</p>"
end

def s3_connect
  require 'aws/s3'
  begin
    AWS::S3::Base.connection
  rescue
    ey_cloud = open(File.expand_path('~/.ey-cloud.yml')) { |f| YAML::load(f) }
    AWS::S3::Base.establish_connection!(
      :access_key_id     => ey_cloud[:aws_secret_id],
      :secret_access_key => ey_cloud[:aws_secret_key])
  end
end

def jruby_org_bucket
  s3_connect
  AWS::S3::Bucket.find('jruby.org')
end

def add_public_read_perm(obj)
  return if obj.acl.grants.detect {|g| g.grantee.group == "AllUsers" && g.permission == "READ" }
  puts "Updating #{obj.key} to be publicly readable"
  obj.acl.grants << AWS::S3::ACL::Grant.grant(:public_read)
  obj.acl(obj.acl)              # save the permissions
end

def log_line_match(line)
  unless @line_def
    require 'request_log_analyzer'
    require 'request_log_analyzer/file_format'
    require 'request_log_analyzer/file_format/amazon_s3'
    @format = RequestLogAnalyzer::FileFormat::AmazonS3.create
    @req = @format.request
    @line_def = @format.line_definitions[:access]
    # Bleh. R-L-A's S3 format is a little buggy, this fixes it
    @line_def.regexp = Regexp.new(@line_def.regexp.to_s.sub('(\\d+) (\\d+) (\\d+) (\\d+)', '([^\\ ]+) ([^\\ ]+) ([^\\ ]+) ([^\\ ]+)'))
  end
  @line_def.match_for(line, @req)
end

require 'date'
def jruby_download_summary(date = nil, output = nil)
  date ||= Date.today - 1
  output = File.new(output, "w") if String === output
  output ||= $stdout
  s3_connect
  log_objects = AWS::S3::Bucket.objects('jrubylogs', :prefix => "jruby-access-log/#{date.to_s}")
  requests = {}
  log_objects.each do |log|
    log.value.each_line do |line|
      match_hash = log_line_match(line)
      if match_hash && match_hash[:key] && match_hash[:http_status] == 200
        file = match_hash[:key]
        if file =~ /.(zip|exe|tar\.gz)$/
          requests[file] ||= 0
          requests[file] += 1
        end
      end
    end
  end
  if requests.size == 0
    output.puts "No requests on #{date}"
  else
    total = 0
    max_width = requests.keys.max {|a,b| a.length <=> b.length }.length
    requests.keys.sort.each do |k|
      total += requests[k]
      output.puts "%-#{max_width}s  %s" % [k, requests[k]]
    end
    output.puts "%-#{max_width}s  %s" % ["Total", total]
  end
end
