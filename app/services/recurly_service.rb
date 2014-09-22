class RecurlyService
  def initialize(integration)
    Recurly.subdomain = integration.subdomain
    Recurly.api_key = integration.api_key
  end

  def account
    Recurly::Account
  end

  def accounts
    account.all
  end

  def connected?
    begin
      Recurly::Account.first
      true
    rescue
      false
    end
  end
end
