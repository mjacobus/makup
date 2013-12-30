require 'makup/helpers/decorator_helper'
require 'makup/decorator'
require 'makup/delegator'

begin
  require 'draper'
  require 'makup/draper_extension'
rescue LoadError
end

module Makup
end

if defined?(ActionView)
  ActionView::Helpers.send(:include, Makup::Helpers::DecoratorHelper)
end

