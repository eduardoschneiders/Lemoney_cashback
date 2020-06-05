class RedirectToOfferController < ApplicationController
  def redirect
    offer = Offer.find(params[:offer_id])

    Reward.create(client: current_client, offer: offer, value: offer.value)

    if request.xhr?
      render json: { redirect_to: offer.url }
    else
      redirect_to offer.url
    end
  end
end