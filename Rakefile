desc "Clean the site"
task :clean do
  rm_rf "_site"
end

desc "Generate the site using Jekyll"
task :generate do
  ruby "-S bundle exec jekyll"
end
task :gen => :generate

desc "Run a file server that serves and regenerates the files"
task :server  do
  ruby "-S bundle exec rackup"
end

desc "Deploy the files to jruby.org"
task :deploy => :generate do
  sh "tar -C _site/ -zcf - . | ssh deploy@jruby.org 'cd /data/jruby.org && tar zxf -'"
end

task :default do
  puts "JRuby.org documentation site. Available tasks:"
  Rake.application.options.show_tasks = true
  Rake.application.options.full_description = false
  Rake.application.options.show_task_pattern = //
  Rake.application.display_tasks_and_comments
end

def manifest_xml(stream = File.new('s3manifest.xml'))
  require 'rexml/document'
  @doc ||= REXML::Document.new(stream)
end

file 's3manifest.xml' do |t|
  require 'open-uri'
  open("http://jruby.org.s3.amazonaws.com/") do |xml|
    File.open(t.name, "wb") {|f| manifest_xml(xml).write(f, 2) }
  end
end

task :indexes => 's3manifest.xml' do
  entries = manifest_xml.root.elements.to_a('/ListBucketResult/Contents/Key').map do |el|
    el.text.strip.sub(/_\$folder\$$/, '/')
  end
  dirs = {"." => []}
  entries.sort.each do |f|
    dirs[File.dirname(f)] ||= []
    dirs[File.dirname(f)] << f
  end
  top = "www/files"
  mkdir_p top
  dirs.each do |dir,entries|
    mkdir_p File.expand_path(File.join(top, dir))
    File.open(File.expand_path(File.join(top, dir, "index.html")), "wb") do |html|
      html.puts <<HDR
---
layout: main
title: Files/#{dir == '.' ? '' : dir}
---
<h1>Files/#{dir == '.' ? '' : dir}</h1>
<div>
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
      html.puts "</div>"
    end
  end
end
