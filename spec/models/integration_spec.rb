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
  subject { create(:integration, name: 'recurly', subdomain: 'jaxons', api_key: '4fb43a698b5f4c58b3b5bc84233a2ada') }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:organisation_id) }
  it { should belong_to(:organisation) }


  describe '#connected?' do
    it 'should check whether the integration is working' do
      VCR.use_cassette('recurly_connected') do
        expect(subject.connected?).to be true
      end
    end
  end

  describe '#service' do
    specify { expect(subject.service.class.to_s).to eq 'RecurlyService' }
  end
end
