require_relative 'thing'

class Room < Thing
  attr_reader :rooms
  def initialize(name, description, n, s, w, e)
    super(name, description)
    @rooms = {:n => n, :s => s, :w => w, :e => e}
  end
end

class Map < Array
  def initialize(*args)
    super(args)
  end
end

class Actor < Thing
  attr_reader :pos
  def initialize(name, description, pos)
    super(name, description)
    @pos = pos
  end
end 









