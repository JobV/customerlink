class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      org = Organisation.create(name: params[:user][:organisation_name])
      org.users << resource
    end
  end
end
