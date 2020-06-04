require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  test "should not save offer without title" do
    article = Offer.new
    assert_not offer.save
  end
end
