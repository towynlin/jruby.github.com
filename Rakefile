desc "Clean the site"
task :clean do
  rm_rf "_site"
end

desc "Generate the site using Jekyll"
task :generate do
  ruby "bin/jekyll"
end

desc "Run a file server that serves and regenerates the files"
task :server  do
  ruby "bin/rackup"
end

desc "Deploy the files to jruby.org"
task :deploy => :generate do
  puts "Does nothing yet"
end

task :default do
  puts "JRuby.org documentation site. Available tasks:"
  Rake.application.options.show_tasks = true
  Rake.application.options.full_description = false
  Rake.application.options.show_task_pattern = //
  Rake.application.display_tasks_and_comments
end
