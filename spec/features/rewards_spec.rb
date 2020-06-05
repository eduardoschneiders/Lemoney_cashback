require 'rails_helper'

describe 'Rewards page' do
  before do
    create(:reward, :confirmed, client: client, offer: walmart_offer, value: 1)
    create(:reward, :confirmed, client: client, offer: ebay_offer, value: 2)
    create(:reward, :confirmed, client: client, offer: macys_offer, value: 3)
    create(:reward, client: client, offer: jcpenney_offer, value: 4)
  end

  let(:walmart_offer) { create(:offer, advertiser_name: 'Wallmart')}
  let(:ebay_offer) { create(:offer, advertiser_name: 'Ebay')}
  let(:macys_offer) { create(:offer, advertiser_name: 'Macys')}
  let(:jcpenney_offer) { create(:offer, advertiser_name: 'JCPenney')}

  context 'logged in' do
    before do
      login_as client, :scope => :client
    end

    let(:client) { create(:client) }

    it 'should list the confirmed rewards' do
      visit rewards_path
      expect(page).to have_content('Your rewards:')

      within '.rewards' do
        expect(page).to have_content('Wallmart reward')
        expect(page).to have_content('Ebay reward')
        expect(page).to have_content('Macys reward')
        expect(page).not_to have_content('JCPenney reward')
      end
    end
  end
end