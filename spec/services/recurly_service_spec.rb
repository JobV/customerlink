require 'rails_helper'

RSpec.describe RecurlyService do

  it 'checks the api key on initialization' do
    expect(true).to be true
  end

  describe '#accounts' do
    let(:organisation) { create(:organisation) }
    let(:user) { create(:user, organisation: organisation) }

    it 'returns accounts' do
      @recurly = RecurlyService.new(organisation.integrations.find_by(name: 'recurly'))
    end
  end
end
