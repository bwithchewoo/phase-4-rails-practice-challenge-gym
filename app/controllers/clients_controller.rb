class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response
  before_action :set_client, only: [:show, :destroy]

  # GET /clients/1
  def show
    render json: @client
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def client_params
    params.require(:client).permit(:name, :age)
  end
  def render_record_not_found_response(invalid)
      render json: {errors: invalid.record.errors.full_messages}, status: :not_found
  end

end
