require 'spec_helper'

describe Makup::Delegator do
  let(:model)     { DummyModel.new }
  let(:decorator) { DummyModelDecorator.new(model) }
  let(:makup)     { Makup::Decorator.new(decorator.h) }
  subject { decorator }

  it "returns the makup decorator formated value, when applies" do
    date = Date.today
    model.date = date
    expect(subject.date).to eq(makup.decorate(date))
  end

  it "returns the draper method when it exists" do
    time = Time.now
    model.time = time
    expect(subject.time).to eq('decorated time')
  end

  it "returns the object value when no makup and draper methdos are available" do
    expect(subject.object_method).to eq('object_method')
  end
end
