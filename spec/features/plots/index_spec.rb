require 'rails_helper'

RSpec.describe 'plots index page' do
  before(:each) do
    @garden = Garden.create!(name: "Backyard Garden")

    @plot_1 = @garden.plots.create!(number: 20, size: "Medium", direction: "North")
    @plot_2 = @garden.plots.create!(number: 30, size: "Large", direction: "East")

    @plant_1 = @plot_1.plants.create!(name: "Basil", description: "Great for italian dishes", days_to_harvest: 25)
    @plant_2 = @plot_2.plants.create!(name: "Sunflower", description: "These are really tall", days_to_harvest: 15)
  end

  it 'shows all of the plots numbers' do
    visit "/plots"

    expect(page).to have_content(@plot_1.number)
    expect(page).to have_content(@plot_2.number)
  end

  it 'shows each plant that belongs to a plot' do
    visit "/plots"
    expect(page).to have_content(@plant_1.name)
    expect(page).to have_content(@plant_2.name)
  end
end
