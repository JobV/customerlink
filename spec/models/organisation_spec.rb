# == Schema Information
#
# Table name: organisations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Organisation, :type => :model do
  let(:organisation) { create(:organisation) }

  describe '#recurly' do

    it 'creates the integration when it does not exist yet' do
      expect(organisation.integrations.count).to eq 0
      expect(organisation.recurly).to be
      expect(organisation.integrations.count).to eq 1
    end

    it 'returns the integration when it already exists' do
      organisation.integrations.create(name: 'recurly')
      expect(organisation.integrations.count).to eq 1
      expect(organisation.recurly).to be
      expect(organisation.integrations.count).to eq 1
    end
  end
end
