class DummyModelDecorator < Draper::Decorator
  delegate_all

  def time
    'decorated time'
  end

end
