require 'bundler'
Bundler.require

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'coffee', 'coffee'
end

require_all 'app'
