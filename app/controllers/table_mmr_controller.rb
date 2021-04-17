class TableMmrController < ApplicationController
  def index
    @users = User.all
  end
end
