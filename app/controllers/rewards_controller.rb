class RewardsController < ApplicationController
  before_action :authenticate_client!

  def index
    @rewards = current_client.rewards.confirmed
  end
end