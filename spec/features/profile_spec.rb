require 'rails_helper'

feature 'profile' do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user updates company name through profile' do
    sign_in(user)

    click_on 'Profile'

    expect(page).to have_text("Big corporation's Profile")
    #
    fill_in 'user_organisation_attributes_name', with: 'new_name'
    fill_in 'user_current_password', with: 'jobiscool'

    expect{click_on 'Save'}.to change{user.organisation.name}
    expect(page).to have_text('Profile is updated')
  end
end
