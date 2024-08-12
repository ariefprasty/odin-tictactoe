class Player
  attr_accessor :name, :marker, :score

  def initialize(name, marker)
    @name = name
    @marker = marker
    @score = 0
  end

  def increase_score
    @score += 1
  end
end
