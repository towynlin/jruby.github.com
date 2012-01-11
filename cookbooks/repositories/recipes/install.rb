#
# Cookbook Name:: repositories
# Recipe:: install
#

Repositories = {
  'jruby.org' => 'jruby.github.com'
}

Dir['/home/git/repositories/*'].each do |repo|
  name = File.basename(repo, '.git')
  Repositories[name] ||= name
end

Repositories.each_pair do |repo,remote|
  execute "#{repo}-add-github-remote" do
    cwd "/home/git/repositories/#{repo}.git"
    user "git"
    group "git"
    command "git remote add github git@github.com:jruby/#{remote}.git"
    not_if { File.exist?("/home/git/repositories/#{repo}.git/hooks/post-receive") }
  end

  update_file "/home/git/repositories/#{repo}.git/hooks/post-receive" do
    action :rewrite
    owner "git"
    group "git"
    mode 0755
    body <<-SCR
#/bin/bash

read oldrev newrev refname
git push github `basename $refname`
SCR
  end
end
