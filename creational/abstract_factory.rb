class Game
  attr_reader :title

  def initialize(title)
    @title = title
  end

  def description
    raise NotImplementedError
  end
end

class Shooter < Game
  def description
    puts "I am a Shooter named #{title}"
  end
end

class Srategy < Game
  def description
    puts "I am a Srategy named #{title}"
  end
end

class GameFactory
  TYPES = {
    shooter: Shooter,
    strategy: Srategy
  }.freeze

  def initialize(game_type)
    @game_type = game_type
  end

  def create(title)
    TYPES[@game_type].new(title)
  end
end

class SteemStore
  def initialize
    @games = []
  end

  def add_games(number, type)
    case type
    when :shooter then title = 'Left for dead'
    when :strategy then title = 'Heroes of Might & Magic'
    else
      raise 'Unsupported game type'
    end

    number.times do |i|
      @games << GameFactory.new(type).create("#{title} #{i+1}")
    end
  end

  def show_games
    p games.map(&:title)
  end

  private

  attr_reader :games
end

game_store = SteemStore.new
game_store.add_games(2, :shooter)
game_store.add_games(5, :strategy)
game_store.show_games
