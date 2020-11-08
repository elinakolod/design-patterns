class Movie
  def initialize(name, genre, ratings)
    @name = name
    @genre = genre
    @ratings = ratings
    @state = 'expected'
  end

  def premiere!
    puts "Premier of #{name} #{Time.now}"
    state = 'released'
  end

  private

  attr_reader :name, :genre, :ratings
end

class Show
  def premiere!
    puts "Premier of the show #{Time.now}"
  end
end

class Cinema
  attr_accessor :catalog

  def initialize
    @catalog = {}
  end

  def place_into_rotation(movie_type)
    movie_prototype = catalog[movie_type]
    raise 'unsupported movie type' unless movie_prototype

    movie = movie_prototype.clone
    movie.premiere!
    movie
  end
end

cinema = Cinema.new
movie = Movie.new('Doctor Sleep', 'horror', { 'IMDb' => 7.3, 'RottenTomatoes' => 77 })
cinema.catalog['movie'] = movie
movie = cinema.place_into_rotation('movie')
show = Show.new
cinema.catalog['show'] = show
movie = cinema.place_into_rotation('show')
