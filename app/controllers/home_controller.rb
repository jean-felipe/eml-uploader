class HomeController < ApplicationController
  def index
      @props = {
      component_name: 'uploads',
      component_data: []
    }
  end
end