require 'spec_helper'

module Makup
  module Helpers
    module DecoratorHelper
      def decorator_helper_included?
        true
      end
    end
  end
end


describe DecoratorHelper do
  it "makes sure the makup decorator is working" do
    expect(helper.decorator_helper_included?).to be_true
  end
end
