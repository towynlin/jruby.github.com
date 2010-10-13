begin
  require 'bundler'
  Bundler.setup
rescue LoadError
  puts "Please install Bundler and run 'bundle install' to ensure you have all dependencies"
end

desc "Clean the site"
task :clean do
  rm_rf "_site"
end

desc "Generate the site using Jekyll"
task :generate => :check_pygments do
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

desc "Deploy Nginx config changes"
task :nginx do
  sh "tar -C conf/ -zcf - . | ssh deploy@jruby.org 'cd /etc/nginx/servers && sudo tar zxf - && sudo /etc/init.d/nginx reload'"
end

task :default do
  puts "JRuby.org documentation site. Available tasks:"
  Rake.application.options.show_tasks = true
  Rake.application.options.full_description = false
  Rake.application.options.show_task_pattern = //
  Rake.application.display_tasks_and_comments
end

task :check_pygments do
  `which pygmentize`
  $?.success? or raise "Pygments not installed, see http://pygments.org/docs/installation/"
end

file 's3manifest.xml' do |t|
  require 'open-uri'
  open("http://jruby.org.s3.amazonaws.com/") do |xml|
    File.open(t.name, "wb") {|f| manifest_xml(xml).write(f, 2) }
  end
end

desc "Create browsable index.html files for S3"
task :indexes => 's3manifest.xml' do
  top = "www/files"
  mkdir_p top, :verbose => false
  sorted_manifest_directories.each do |dir,entries|
    mkdir_p File.expand_path(File.join(top, dir)), :verbose => false
    File.open(File.expand_path(File.join(top, dir, "index.html")), "wb") do |html|
      write_index_html(html, dir, entries)
    end
  end
end

task :update_hash_files do
  jruby_org_bucket.objects.each do |obj|
    next unless obj.key =~ /\.(md5|sha1)$/
    unless obj.content_type == "text/plain"
      puts "Updating #{obj.key} to Content-Type: text/plain"
      obj.content_type = "text/plain"
      obj.store
      add_public_read_perm(obj)
    end
  end
end

task :update_read_perms do
  jruby_org_bucket.objects.each do |obj|
    add_public_read_perm(obj)
  end
end

desc "Print a summary of yesterday's file downloads"
task :download_summary do
  jruby_download_summary ENV['DATE'], ENV['OUTPUT']
end
