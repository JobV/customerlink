require 'rails_helper'

feature 'Session management' do
  scenario 'User registers' do
    visit '/'
    expect(page).to have_text('Sign in')

    click_on 'Sign up'

    fill_in 'Email', with: 'test@example.com'
    fill_in 'Organisation name', with: 'GitLab'
    fill_in 'user_password', with: 'jobiscool'
    fill_in 'Password confirmation', with: 'jobiscool'

    click_on 'Sign up'

    expect(Organisation.last.name).to eq 'GitLab'
  end

  scenario 'User signs in' do
    user = create(:user, password: 'jobiscool')
    visit '/'
    expect(page).to have_text('Sign in')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'jobiscool'

    click_on 'Sign in'

    expect(page).to have_http_status(:success)
  end
end
