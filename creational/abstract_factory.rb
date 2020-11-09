class Game
  attr_reader :title

  def initialize(title)
    @title = title
  end

  def description
    raise NotImplementedError
  end
end

class Movie
  attr_reader :title

  def initialize(title)
    @title = title
  end

  def rating
    raise NotImplementedError
  end
end

class Movie
  attr_reader :title

  def initialize(title)
    @title = title
  end

  def rating
    raise NotImplementedError
  end
end

class Shooter < Game
  def description
    puts "I am a Shooter named #{title}"
  end
end

class Horror < Movie
  def rating
    puts "77%"
  end
end

class Cartoon < Movie
  def rating
    puts "100%"
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
    @title = fetch_title
  end

  def create
    TYPES[game_type].new(@title)
  end

  private

  attr_reader :game_type

  def fetch_title
    case game_type
    when :shooter then title = 'Left for dead'
    when :strategy then title = 'Heroes of Might & Magic'
    else
      raise 'Unsupported game type'
    end
  end
end

class MovieFactory
  TYPES = {
    horror: Horror,
    cartoon: Cartoon
  }.freeze

  def initialize(movie_type)
    @movie_type = movie_type
    @title = fetch_title
  end

  def create
    TYPES[movie_type].new(@title)
  end

  private

  attr_reader :movie_type

  def fetch_title
    case movie_type
    when :horror then title = 'Doctor Sleep'
    when :cartoon then title = 'Up'
    else
      raise 'Unsupported movie'
    end
  end
end

class SteemStore
  def initialize
    @games = []
    @movies = []
  end

  def add_games(number, type)
    number.times do |i|
      @games << GameFactory.new(type).create
    end
  end

  def add_movies(number, type)
    number.times do |i|
      @movies << MovieFactory.new(type).create
    end
  end

  def show_games
    games.each(&:description)
  end

  def show_movies
    movies.each(&:rating)
  end

  private

  attr_reader :games, :movies
end

game_store = SteemStore.new
game_store.add_games(2, :shooter)
game_store.add_games(5, :strategy)
game_store.add_movies(2, :horror)
game_store.add_movies(3, :cartoon)
game_store.show_games
game_store.show_movies
