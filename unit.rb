class Unit 
  attr_reader :health_points, :attack_power
  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end 

  def attack!(enemy)
    if self.dead? || enemy.dead?
      nil
    else
      enemy.damage(@attack_power)
    end
  end 

  def damage(attack_power)
    @health_points -= attack_power
  end 

  def dead?
    health_points <= 0
  end 

end 