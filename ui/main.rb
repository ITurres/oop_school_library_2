require_relative 'app'
require_relative '../helpers/options_hash'

def main
  app = App.new
  options = options_hash

  puts 'Welcome to School Library App!'
  puts

  # * 'run_options' has being required from app on 'dependencies.rb'
  run_options(options, app)
end

main
