require 'rails_helper'

feature 'Recurly sync' do
  let(:user) { create(:user) }
  before { sign_in(user) }

  scenario 'sync with recurly' do
    visit '/'
    click_on 'Sync'
    expect(page).to have_content 'test'
  end
end
