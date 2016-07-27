# http://classic.battle.net/war3/human/units/footman.shtml
require_relative 'unit'

class Footman < Unit 

  def initialize(health_points=60, attack_power=10)
    super(health_points, attack_power)

    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
  end

  def attack!(enemy)
    if enemy.is_a? Barracks
      enemy.damage(@attack_power/2.ceil)
    else 
      super
    end 
  end 


end
