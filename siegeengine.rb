require_relative 'unit'

class SiegeEngine < Unit 

  def initialize
     super(400, 50)
  end  

  def attack!(enemy)
    if self.dead? || enemy.dead? 
      nil
    elsif enemy.is_a? SiegeEngine
      enemy.damage(@attack_power)
    elsif enemy.is_a? Barracks
      enemy.damage(@attack_power*2.ceil)
    elsif enemy.is_a? Unit
      nil
    else
      enemy.damage(@attack_power)
    end
  end 

end 