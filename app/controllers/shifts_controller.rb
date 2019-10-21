class ShiftsController < ApplicationController

  def index
    @shift = Shift.all
  end

  def update

  end

  private

end
