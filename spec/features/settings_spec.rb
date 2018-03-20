require 'rails_helper'

feature 'settings' do
  before do
    stub_request(:get, "https://.recurly.com/v2/accounts?per_page=1").
         to_return(:status => 200, :body => "", :headers => {})    
  end

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user updates api settings for the first time' do
    sign_in(user)

    expect(user.organisation.integrations.count).to eq 0

    click_on 'Integrations'

    expect(page).to have_text('Recurly')

    expect(user.organisation.integrations.last.name).to eq 'recurly'

    fill_in 'integration_api_key', with: 'asdf'
    fill_in 'integration_subdomain', with: 'test'

    stub_request(:get, "https://asdf:@test.recurly.com/v2/accounts?per_page=1").
         to_return(:status => 200, :body => "", :headers => {})
    click_on 'Update integration'

    recurly = user.organisation.integrations.last
    expect(recurly.api_key).to eq 'asdf'
    expect(recurly.subdomain).to eq 'test'

    expect(page).to have_text('')
  end
end
