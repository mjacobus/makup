require 'spec_helper'

class DummyHelper
  include Makup::Helpers::DecoratorHelper
end

class DummyDecorator
  attr_reader :object
  def initialize(model)
    @object = model
  end
end

describe Makup::Helpers::DecoratorHelper do
  subject { DummyHelper.new }

  describe "#decorate" do
    let(:model) { DummyModel.new }

    it "resolves the correct decorator" do
      decorator = subject.decorate(model)
      expect(decorator).to be_a(DummyModelDecorator)
      expect(decorator.object).to be(model)
    end

    it "accepts block" do
      resolved = nil
      decorator = subject.decorate(model) do |decorator|
        resolved = decorator
      end
      expect(resolved).to be_a(DummyModelDecorator)
      expect(decorator).to be(resolved)
    end

    it "accetps alternative decorator class" do
      decorator = subject.decorate(model, DummyDecorator)
      expect(decorator).to be_a(DummyDecorator)
      expect(decorator.object).to be(model)
    end
  end
end
