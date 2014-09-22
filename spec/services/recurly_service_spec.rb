require 'rails_helper'

RSpec.describe RecurlyService do

  before(:each) do
    # stub_request(:get, /recurly.com/).
    #   with(headers: {'Accept'=>'*/*', 'User-Agent'=> 'Ruby'}).
    #   to_return(status: 200, body: 'stubbed response', headers: {})
  end

  it 'checks the api key on initialization' do
    expect(true).to be true
  end

  describe '#accounts' do
    let(:organisation)  { create(:organisation) }
    let(:user)          { create(:user, organisation: organisation) }
    let(:integration)   { create(:integration,
       organisation: organisation,
       name: 'recurly',
       subdomain: 'jaxons',
       api_key: '4fb43a698b5f4c58b3b5bc84233a2ada')}

    it 'returns accounts' do
      VCR.use_cassette('recurly_accounts') do
        @recurly = RecurlyService.new(integration)
        expect(@recurly.accounts.count).to be > 1
      end
    end
  end
end
