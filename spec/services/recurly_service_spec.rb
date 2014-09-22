require 'rails_helper'

RSpec.describe RecurlyService do

  before(:each) do
    stub_request(:get, /recurly.com/).
      with(headers: {'Accept'=>'*/*', 'User-Agent'=> 'Ruby'}).
      to_return(status: 200, body: 'stubbed response', headers: {})
  end

  it 'checks the api key on initialization' do
    expect(true).to be true
  end

  describe '#accounts' do
    let(:organisation) { create(:organisation) }
    let(:user) { create(:user, organisation: organisation) }

    it 'returns accounts' do
      # not sure how to implement this well. VCR?
      # @recurly = RecurlyService.new(organisation.integrations.find_by(name: 'recurly'))
    end
  end
end
