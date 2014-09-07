class IntegrationsController < ApplicationController

  # TODO write test for this
  def index
    @recurly = current_user.organisation.integrations.find_or_create_by(name: 'recurly')
  end

  # TODO write test for this
  def update
    @integration = Integration.find(params[:id])
    if @integration.update(integration_params)
      redirect_to integrations_path, notice: 'Integration updated.'
    else
      redirect_to integrations_path, notice: 'Integration failed to update.'
    end
  end

  private
    def integration_params
      params.require(:integration).permit(:name, :api_key, :subdomain)
    end
end
