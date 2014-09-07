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

require 'rails_helper'

RSpec.describe Integration, :type => :model do
  subject { create(:integration) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:organisation_id) }
  it { should belong_to(:organisation) }

end
