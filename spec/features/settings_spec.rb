require 'rails_helper'

feature 'settings' do
  scenario 'user updates api settings' do
    user = create(:user, password: 'jobiscool')
    sign_in(user)

    click_on 'Integrations'

    expect(page).to have_text('Recurly')
  end
end
