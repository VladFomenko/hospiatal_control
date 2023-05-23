# frozen_string_literal: true

class ClientsController < ApplicationController
  before_action :client_params, only: %i[create update]
  before_action :set_clients, only: :index
  before_action :set_client, only: %i[show update destroy]

  load_and_authorize_resource

  def index
    @clients
  end

  def show
    @client
  end

  def create; end

  def update
    if @client.update(client_params)
      redirect_to client_path(@client), notice: 'Client updated successfully'
    else
      render :edit, notice: 'Failed to update'
    end
  end

  def destroy
    @client.destroy
  end

  private

  def current_ability
    user = current_client || current_doctor
    @current_ability ||= Ability.new(user)
  end

  def set_clients
    @clients = Client.all
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:first_name, :second_name, :birth_date, :phone_number, :avatar)
  end
end
