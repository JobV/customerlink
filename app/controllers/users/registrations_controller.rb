class Users::RegistrationsController < Devise::RegistrationsController



  def create
    super do |resource|
      org = Organisation.create(name: params[:user][:organisation_name])
      org.users << resource
    end
  end

  protected

  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end
  #
  # private
  #
  # def user_params
  #   params.require(:user).permit(:email, organisation: [:name])
  # end

end
