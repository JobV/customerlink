# == Schema Information
#
# Table name: integrations
#
#  id              :integer          not null, primary key
#  name            :string(255)      default("")
#  api_key         :string(255)      default("")
#  subdomain       :string(255)      default("")
#  organisation_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :integration do
    name "MyString"
    api_key "MyString"
    subdomain "MyString"
    organisation
  end
end
