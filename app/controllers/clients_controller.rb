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

  def create
    client = Client.create(client_params)

    if client.save

    else

    end
  end

  def update
    if @client.update(client_params)

    else

    end
  end

  def destroy
    @client.destroy
  end

  private

  def set_clients
    @clients = Client.all
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.client.permit(:first_name, :second_name, :birth_date, :phone_number, :password)
  end
end
