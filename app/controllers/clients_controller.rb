# frozen_string_literal: true

class ClientsController < ApplicationController
  before_action :client_params, only: %i[create update]
  before_action :set_clients, only: :index
  before_action :set_client, only: %i[show update destroy]

  def index
    @clients
  end

  def show
    @client
  end

  def create; end

  def update
    if @client.update(client_params)
      flash[:notice] = 'The update has been successfully completed'
      flash[:notice_class] = 'alert-success'
    else
      flash[:notice] = 'Failed to update'
      flash[:notice_class] = 'alert-danger'
    end
    redirect_to client_path(current_client)
  end

  def destroy
    @client.destroy
  end

  private

  def set_clients
    @clients = Client.all
  end

  def set_client
    @client = current_client || Client.find(params[:client])
  end

  def client_params
    params.require(:client).permit(:first_name, :second_name, :birth_date, :phone_number)
  end
end
