require 'rails_helper'

feature 'settings' do
  scenario 'user updates api settings for the first time' do
    user = create(:user, password: 'jobiscool')
    sign_in(user)

    expect(user.organisation.integrations.count).to eq 0

    click_on 'Integrations'

    expect(page).to have_text('Recurly')

    expect(user.organisation.integrations.last.name).to eq 'recurly'

    fill_in 'integration_api_key', with: 'asdf'
    fill_in 'integration_subdomain', with: 'test'

    click_on 'Update integration'

    recurly = user.organisation.integrations.last
    expect(recurly.api_key).to eq 'asdf'
    expect(recurly.subdomain).to eq 'test'
  end
end
