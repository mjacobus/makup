class HomeController < ApplicationController
  def index
    @dummy = DummyModel.last
  end
end
