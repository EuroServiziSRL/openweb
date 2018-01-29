class TestController < ApplicationController
  def show
    render template: "test/#{params[:page]}"
  end
end