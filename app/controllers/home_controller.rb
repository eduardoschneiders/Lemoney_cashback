class HomeController < ApplicationController
  def index
    @offers = Offer.published
  end
end
