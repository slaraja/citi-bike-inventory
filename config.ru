require './config/environment'

use Rack::MethodOverride

use SessionsController
use ItemController
use UserController
run ApplicationController
