class UsuariosController < ApplicationController
  before_action :authenticate_user

  def show
    render json: { user: find_user_data }, status: :ok
  end

  private

  def find_user_data
    params[:session_user].slice(:name, :email, :created_at)
  end
end
