module Makup
  class Decorator

    attr_accessor :helpers

    def initialize(helpers = nil)
      @helpers = helpers
      @helpers ||= ApplicationController.helpers rescue nil
    end

    def decorate(value)
      method = decorator_method(value)

      if respond_to?(method)
        send(method, value)
      else
        value
      end
    end

    def decorator_method(value)
      type = value.class.to_s.gsub('::', '_')
      "decorate_#{type}"
    end

    def decorate_Date(value)
      l(value)
    end

    def decorate_Time(value)
      l(value)
    end

    def decorate_TrueClass(value)
      t(value.to_s)
    end

    def decorate_FalseClass(value)
      t(value.to_s)
    end

    def decorate_Float(value)
      helpers.number_with_delimiter(value)
    end

    def decorate_Fixnum(value)
      helpers.number_with_delimiter(value)
    end

    def l(value, options = {})
      if helpers.present?
        helpers.l(value, options)
      else
        I18n.l(value, options)
      end
    end

    def t(value, options = {})
      if helpers.present?
        helpers.t(value, options)
      else
        I18n.t(value, options)
      end
    end
  end
end
