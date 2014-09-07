# == Schema Information
#
# Table name: organisations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Organisation < ActiveRecord::Base
  has_many :users
  has_many :integrations

  def recurly
    integrations.find_or_create_by(name: 'recurly')
  end
end
