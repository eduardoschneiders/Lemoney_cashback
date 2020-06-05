require 'rails_helper'

describe 'Home page' do
  
    let!(:offer1) { create(:offer, advertiser_name: 'Wallmart') }
    let!(:offer2) { create(:offer, advertiser_name: 'Ebay', url: 'http://ebay.com') }
    let!(:offer3) { create(:offer, advertiser_name: 'Macys') }
    let!(:offer4) { create(:offer, advertiser_name: 'JCPenney') }
  

  it 'should list the valid offers' do
    visit root_path
    expect(page).to have_content('Offers:')

    within '.offers' do
      expect(page).to have_content('Wallmart')
      expect(page).to have_content('Ebay')
      expect(page).to have_content('Macys')
      expect(page).to have_content('JCPenney')
    end
  end

  it 'should redirect to login path' do
    visit root_path
    within '.offers' do
      link = find(:xpath, "//h5[.='Ebay']").find(:xpath, '..').find('a')

      expect(link[:href]).to eql(new_client_session_path(return_to: redirect_to_offer_path(offer_id: offer2.id.to_s)))
    end
  end

  context 'logged in' do
    before do
      login_as client, :scope => :client
    end

    let(:client) { create(:client) }

    it 'should redirect to login path' do
      visit root_path
      within '.offers' do
        link = find(:xpath, "//h5[.='Ebay']").find(:xpath, '..').find('a')

        expect(link[:href]).to eql(redirect_to_offer_path(offer_id: offer2.id.to_s))
      end
    end
  end
end
