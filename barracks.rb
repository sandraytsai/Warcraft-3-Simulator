class Barracks 
  attr_reader :gold, :food, :health_points, :lumber

  def initialize
    @gold = 1000
    @food = 80
    @health_points = 500
    @lumber = 500
  end 

  def can_train_footman?
    self.gold >= 135 && self.food >= 2
  end

  def train_footman
    if can_train_footman? 
      @gold -= 135
      @food -= 2 
      Footman.new
    end
  end 

  def can_train_peasant?
    self.gold >= 90 && self.food >= 5
  end 

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    end
  end

  def can_build_siege_engine?
    self.gold >= 200 && self.food >= 3 && self.lumber >= 60
  end 

  def build_siege_engine
    if can_build_siege_engine?
      @gold -= 200
      @food -= 3
      @lumber -= 60 
      SiegeEngine.new 
    end
  end

  def damage(attack_power)
    @health_points -= attack_power
  end 

  def dead?
    @health_points <= 0
  end 

end
