desc "Init new vim setup"
task :init do
  system "git submodule init"
  system "git submodule update"
end

desc "Update submodules"
task :update do
  system "git submodule foreach git pull origin master"
end
