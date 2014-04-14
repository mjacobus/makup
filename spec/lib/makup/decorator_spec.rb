require 'spec_helper'

module Name
  module Spaced
    class MyClass
    end
  end
end

describe Makup::Decorator do
  describe "#decorate" do
    it "decorates Date" do
      date = Date.today
      expect(subject.decorate(date)).to eq(I18n.l(date))
    end

    it "decorates Time" do
      time = Time.now
      expect(subject.decorate(time)).to eq(I18n.l(time))
    end

    it "decorates Boolean" do
      expect(subject.decorate(true)).to eq('Sim')
      expect(subject.decorate(false)).to eq('Não')
    end

    it "decorates Float" do
      expect(subject.decorate(1_000_000.21)).to eq('1.000.000,21')
      expect(subject.decorate(1_000_000.211)).to eq('1.000.000,211')
    end

    it "decorates Fixnum" do
      expect(subject.decorate(1_000_000)).to eq('1.000.000')
    end

    it "decorates ActiveSupport::TimeWithZone" do
      time = Time.zone.now
      expect(subject.decorate(time)).to eq(I18n.l(time))
    end
  end

  describe "#decorator_method" do
    it "retruns the correct decorator method name for simple classes" do
      expect(subject.decorator_method(Time.now)).to eq('decorate_Time')
      expect(subject.decorator_method(Date.today)).to eq('decorate_Date')
    end

    it "returns the correct decorator ethod name for namespaced classes" do
      expect(subject.decorator_method(Name::Spaced::MyClass.new)).to eq('decorate_Name_Spaced_MyClass')
    end
  end

end
