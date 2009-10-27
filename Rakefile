desc "Clean the site"
task :clean do
  rm_rf "_site"
end

desc "Generate the site using Jekyll"
task :generate do
  ruby "bin/jekyll"
end
task :gen => :generate

desc "Run a file server that serves and regenerates the files"
task :server  do
  ruby "bin/rackup"
end

desc "Deploy the files to jruby.org"
task :deploy => :generate do
  rm_f "jruby_site.tgz"
  sh "tar -C _site/ -zcf jruby_site.tgz ."
  sh "scp jruby_site.tgz jruby.org:/tmp"
  sh "ssh jruby.org 'cd /home/apps/jruby/public && umask 0002 && tar zxf /tmp/jruby_site.tgz && rm -f /tmp/jruby_site.tgz'"
end

task :default do
  puts "JRuby.org documentation site. Available tasks:"
  Rake.application.options.show_tasks = true
  Rake.application.options.full_description = false
  Rake.application.options.show_task_pattern = //
  Rake.application.display_tasks_and_comments
end
