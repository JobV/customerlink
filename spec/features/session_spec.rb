require 'rails_helper'

feature 'Session management' do
  scenario 'User registers' do
    visit '/'
    expect(page).to have_text('Log in')

    click_on 'Sign up'

    fill_in 'Email', with: 'test@example.com'
    fill_in 'organisation_name', with: 'GitLab'
    fill_in 'first_name', with: 'Job'
    fill_in 'last_name', with: 'van der Voort'
    fill_in 'password', with: 'jobiscool'
    fill_in 'password_confirmation', with: 'jobiscool'

    click_on 'Create and Sign in'

    expect(User.last.first_name).to be 'Job'
    expect(Organisation.last.name).to be 'GitLab'
  end

  scenario 'User signs in' do
    user = create(:user, password: 'jobiscool')
    visit '/'
    expect(page).to have_text('Log in')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'jobiscool'

    click_on 'Log in'

    expect(page).to have_text('no customers yet, add one now')
  end
end
