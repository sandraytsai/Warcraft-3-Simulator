require_relative 'spec_helper'

describe Barracks do 

  before :each do
    @barrack = Barracks.new
  end

  it "has and knows its HP (health points)" do
    expect(@barrack.health_points).to eq(500)
  end 

end 

describe Footman do

  before :each do
    @footman = Footman.new
    @barrack = Barracks.new
  end 

  it "should reduce health points of Barracks by half of its attack points" do
    @footman.attack!(@barrack)
    expect(@barrack.health_points).to eq(495)
  end 
  
end 
