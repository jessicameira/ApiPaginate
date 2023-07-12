require 'rest-client'

class UsersController < ApplicationController
  BASE_URL = 'https://run.mocky.io/v3/ce47ee53-6531-4821-a6f6-71a188eaaee0'
  def index
    response = RestClient.get(BASE_URL)

    @users = response.code == 200 ? JSON.parse(response.body) : []

    @paginated_users = Kaminari.paginate_array(@users['users']).page(params[:page]).per(10)
  end
end
