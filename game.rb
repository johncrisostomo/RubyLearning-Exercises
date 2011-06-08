require_relative 'room.rb'

class Game
  def initialize(rooms, player)
    @map = Map.new(rooms)
    @player = player
  end
end

class Implementor
end
