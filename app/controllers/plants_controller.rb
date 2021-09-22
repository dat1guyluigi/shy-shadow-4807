class PlantsController < ApplicationController
  def destroy
    plot = Plot.find(params[:id])
    plant = Plant.find(params[:id])
    plant.destroy
  end
end
