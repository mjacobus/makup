# Overrides the delegate_all method
Draper::Decorator.class_eval do
  singleton_class.send(:alias_method, :original_delegate_all, :delegate_all)

  def self.delegate_all
    alias_method :original_method_missing, :method_missing
    original_delegate_all
    include Makup::Delegator
  end
end
