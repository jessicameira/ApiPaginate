require 'rest-client'

class UsersController < ApplicationController
  BASE_URL = ENV['URL']
  def index
    response = RestClient.get(BASE_URL)
    data = JSON.parse(response.body) if response.code == 200

    @users = data['users'] || []

    @paginated_users = Kaminari.paginate_array(@users).page(params[:page]).per(10)
  end
end
