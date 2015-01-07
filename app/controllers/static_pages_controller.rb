class StaticPagesController < ApplicationController
  def home
    @developer = Developer.where.not(latitude:nil)
    # @hash = Gmaps4rails.build_markers(@developers) do |developer, marker|
    #   marker.lat developer.latitude
    #   marker.lng developer.longitude
    # end
  end

  def stack_overflow_users
    page = 1
    begin
      a = StackOverflowSearch.get_users(page, page)
      
      a.each do |user|
        Developer.create(user_id: user[:user_id], name: user[:name], age: user[:age], location: user[:location],
                         accept_rate: user[:accept_rate], website_url:  user[:website_url], link: user[:link], reputation: user[:reputation],
                         reputation_change_year: user[:reputation_change_year], reputation_change_quarter: user[:reputation_change_quarter], 
                         reputation_change_month: user[:reputation_change_month], reputation_change_week: user[:reputation_change_week], 
                         bronze_badges: user[:bronze_badges], silver_badges: user[:silver_badges], gold_badges: user[:gold_badges])
      end

      page +=1

    end while page <= 100

    respond_to do | format |
      format.json {render json: { "# records" => a.length} }
    end
  end
end
