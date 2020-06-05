class HomeController < ApplicationController
  def index
    @offers = Offer.published.limit(50)
  end
end
