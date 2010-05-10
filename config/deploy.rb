set :application, "FamilyChores"
set :repository,  "https://Falex@github.com/Falex/Family_Chores_Calendar"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "multimediaart.at"                          # Your HTTP server, Apache/etc
role :app, "multimediaart.at"                          # This may be the same as your `Web` server
role :db,  "multimediaart.at", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :deploy_to, "/var/www/virthosts/pink.multimediatechnology.at/term4/QPT2b"
set :user, "fhs30412"

set :use_sudo, false
default_run_options[:pty] = true




# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end


 namespace :deploy do
   task :start do
   end
   
   task :stop do
   end
   
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end