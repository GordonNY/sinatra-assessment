require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  # raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::Static, :urls => ['/img', '/css'], :root => 'public' # Rack fix allows seeing the css folder.

use UsersController
use ChannelsController
use PostsController

use Rack::MethodOverride
run ApplicationController