desc "Init new vim setup"
task :init do
  system "git submodule init"
  system "git submodule update"
end

desc "Update submodules"
task :update do
  system "git submodule foreach git pull origin master"
end

desc "Build extensions for modules"
task :build do
  system "cd ~/.vim/bundle/commandt/ruby/command-t/ && /usr/bin/ruby extconf.rb && make"
end
