require_relative 'spec_helper'

describe Barracks do 

  before :each do 
    @barracks = Barracks.new
  end 

  it "has and knows its lumber supply" do 
      expect(@barracks.lumber).to eq(500)
  end 

  describe "#can_build_siege_engine?" do 
    it "returns true when has enough resources to build a siege engine" do 
      expect(@barracks.can_build_siege_engine?).to be_truthy
    end

    it "returns false when there isn't enough gold" do 
      # @barracks = Barracks.new
      expect(@barracks).to receive(:gold).and_return(199)
      expect(@barracks.can_build_siege_engine?).to be_falsey
    end 

    it "returns false when there isn't enough food" do 
      # @barracks = Barracks.new(1000,0,500,500)
      expect(@barracks).to receive(:food).and_return(2)
      expect(@barracks.can_build_siege_engine?).to be_falsey
    end 

    it "returns false when there isn't enough lumber" do 
      # @barracks = Barracks.new(1000,80,500,0)
      expect(@barracks).to receive(:lumber).and_return(59)
      expect(@barracks.can_build_siege_engine?).to be_falsey
    end 
  end 

  describe "#build_siege_engine" do 
    it "does not build a siege engine when it does not have enough resources" do 
      expect(@barracks).to receive(:can_build_siege_engine?).and_return(false)
      expect(@barracks.build_siege_engine).to be_nil
    end
    it "builds a siege enging when it has enough resources" do 
      expect(@barracks).to receive(:can_build_siege_engine?).and_return(true)
      expect(@barracks.build_siege_engine).to be_a(SiegeEngine)
    end
  end 

end 

describe SiegeEngine do 

  before :each do 
    @siegeengine = SiegeEngine.new 
  end 

  it "has and knows its attack power" do 
    expect(@siegeengine.attack_power).to eq(50)
  end 

  it "has and knows its health points" do 
    expect(@siegeengine.health_points).to eq(400)
  end 

  describe "#attack" do 
    it "cannot attack units is a Unit other than a SiegeEngine" do 
      @unit = Unit.new(100,500)
      expect(@siegeengine.attack!(@unit)).to be_nil
    end 

    it "attacks Barracks with double its attack power" do 
      @barracks = Barracks.new 
      @siegeengine.attack!(@barracks)
      expect(@barracks.health_points).to eq(400)
    end 

    it "can attack other SiegeEngines" do 
      @siegeengine2 = SiegeEngine.new
      @siegeengine.attack!(@siegeengine2)
      expect(@siegeengine2.health_points).to eq(350)
    end 
  end 

end 


