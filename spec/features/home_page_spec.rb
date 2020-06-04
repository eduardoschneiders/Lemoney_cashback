require 'rails_helper'

describe 'Home page' do
  before do
    create(:offer, advertiser_name: 'Wallmart')
    create(:offer, advertiser_name: 'Ebay', url: 'http://ebay.com')
    create(:offer, advertiser_name: 'Macys')
    create(:offer, advertiser_name: 'JCPenney')
  end

  it 'should list the valid offers' do
    visit root_path
    expect(page).to have_content('Ofertas:')

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
      link = find(:xpath, "//span[.='Ebay']").find(:xpath, '..').find('a')

      link.click
      expect(current_path).to eql(new_client_session_path)
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
        link = find(:xpath, "//span[.='Ebay']").find(:xpath, '..').find('a')

        expect(link[:href]).to eql('http://ebay.com')
      end
    end
  end
end
