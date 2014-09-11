require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require 'mailgun'

require './app/models/link'
require './app/models/tag'
require './app/models/user'
require './app/controllers/users'
require './app/controllers/tags'
require './app/controllers/sessions'
require './app/controllers/links'
require './app/controllers/application'

require_relative 'helpers/application'
require_relative 'data_mapper_setup'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
set :partial_template_engine, :erb

set :root, File.dirname(__FILE__)
set :public_folder, Proc.new { File.join(root, "..", "public") }

