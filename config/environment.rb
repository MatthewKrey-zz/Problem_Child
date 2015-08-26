require 'bundler'
Bundler.require

$: << '.'
require 'main'
require 'models/haiku'
require 'models/lines'
require 'models/shia_array'
require 'models/user'
require 'bin/run'
