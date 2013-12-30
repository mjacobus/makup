module Makup
  module Delegator
    def makup_decorator
      @makup_decorator ||= Makup::Decorator.new(self.h)
    end

    def method_missing(method, *args, &block)
      value = super(method, *args, &block)
      makup_method = makup_decorator.decorator_method(value)

      if makup_decorator.respond_to?(makup_method)
        return makup_decorator.decorate(value)
      end

      value
    end
  end
end
