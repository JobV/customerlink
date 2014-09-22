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

class Integration < ActiveRecord::Base
  validates :name, :organisation_id, presence: true

  belongs_to :organisation

  def connected?
    subdomain && api_key && service.connected?
  end

  def service
    (name.capitalize + 'Service').constantize.new(self)
  end
end
