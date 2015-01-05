class StaticPagesController < ApplicationController
  def home
    @developers = Developer.all
    @hash = Gmaps4rails.build_markers(@developers) do |developer, marker|
      marker.lat developer.latitude
      marker.lng developer.longitude
    end
  end
end
