require 'rails_helper'

describe 'Rewards page' do
  before do

    create(:reward, client: client, advertiser_name: 'Wallmart')
    create(:reward, client: client, advertiser_name: 'Ebay')
    create(:reward, client: client, advertiser_name: 'Macys')
    create(:reward, client: client, advertiser_name: 'JCPenney')

    login_as client, :scope => :client
  end

  let(:client) { create(:client)}

  xit 'should list the active rewards' do
    visit rewards_path
    expect(page).to have_content('Rewards:')

    within '.rewards' do
      expect(page).to have_content('Wallmart')
      expect(page).to have_content('Ebay')
      expect(page).to have_content('Macys')
      expect(page).to have_content('JCPenney')
    end
  end
end