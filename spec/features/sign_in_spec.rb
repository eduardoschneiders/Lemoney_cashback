require 'rails_helper'

describe 'Sign in' do
  let(:client) { create(:client, email: 'user@gmail.com', password: 'p@ssw0rd') }
  let(:return_to) { 'http://ebay.com/' }

  it 'should redirect to redirect_to param after sign in' do
    visit(new_client_session_path(return_to: return_to))

    page.fill_in('Email', with: client.email)
    page.fill_in('Password', with: client.password) 
    find('input[name="commit"]').click

    expect(current_url).to eql(return_to)
  end
end