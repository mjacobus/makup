module Makup
  module Helpers
    module DecoratorHelper
      def decorate(model, klass = nil)
        klass ||= "#{model.class}Decorator".constantize
        decorator = klass.new(model)
        yield(decorator) if block_given?
        decorator
      end
    end
  end
end

