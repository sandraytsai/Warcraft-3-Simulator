require_relative 'spec_helper'

describe Unit do
  before :each do
    @unit_alive = Unit.new(5,5)
    @unit_dead = Unit.new(0,5)
  end

  describe "#dead?" do
    it "is alive if HP is greater than 0" do
      expect(@unit_alive.dead?).to be_falsey
    end 

    it "is dead if HP is equal to or less than 0" do
      expect(@unit_dead.dead?).to be_truthy
    end 

    it "cannot attack another unit if it is dead" do 
      expect(@unit_dead.attack!(@unit_alive)).to be_nil
    end 

    it "will not attack another unit if the unit is dead" do 
      expect(@unit_alive.attack!(@unit_dead)).to be_nil
    end
  end
end 