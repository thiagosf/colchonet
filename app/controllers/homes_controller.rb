class HomesController < ApplicationController
  def index
    @rooms = Room.most_recent.take(3)
  end
end