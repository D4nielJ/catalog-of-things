class InputJson
  MAP_HASH = {
    authors: lambda { |o, _state, callback:|
      p 'hello world'
      Author.new(id: o['id'], first_name: o['first_name'], last_name: o['last_name'])
    },
    genres: lambda { |o, _state, callback:|
      Genre.new(id: o['id'], name: o['name'])
    },
    labels: lambda { |o, _state, callback:|
      Label.new(id: o['id'], title: o['title'], color: o['color'])
    },
    sources: lambda { |o, _state, callback:|
      Source.new(id: o['id'], name: o['name'])
    },
    movies: lambda { |o, _state, callback:|
      new_object = Movie.new(id: o['id'], name: o['name'], date: o['date'], archived: o['archived'],
                             silent: o['silent'])
      callback(new_object, state)
    },
    games: lambda { |o, state, callback:|
      new_object = Game.new(id: o['id'], name: o['name'], date: o['date'], archived: o['archived'],
                            last_played_at: o['last_played_at'], multiplayer: o['multiplayer'])
      callback(new_object, state)
    },
    albums: lambda { |o, state, callback:|
      new_object = MusicAlbum.new(id: o['id'], name: o['name'], date: o['date'], archived: o['archived'],
                                  on_spotify: o['on_spotify'])
      callback(new_object, state)
    },
    books: lambda { |o, state, callback:|
      new_object = Book.new(id: o['id'], name: o['name'], date: o['date'], archived: o['archived'],
                            publisher: o['publisher'], cover_state: o['cover_state'])
      callback(new_object, state)
    }
  }.freeze

  def initialize(adress = './app/data')
    @adress = adress
    @map_hash = MAP_HASH
  end

  def fetch_data(state)
    fetch_all_files(%w[authors genres labels sources movies games albums books], state)
  end

  private

  def fetch_all_files(arr_files, state)
    arr_files.each { |f| fetch_file(f, state) if File.exist?("#{@adress}/#{f}.json") }
  end

  @create_authors = lambda do |hash|
    Author.new(**hash)
  end

  def fetch_file(file, state)
    json = File.read("#{@adress}/#{file}.json")
    hashes = JSON.parse(json)
    arr = hashes.map { |hash| p @map_hash[file.to_sym].call(hash, state, callback: :assign_attr) }
    state[file.to_sym].concat(arr)
  end

  def build_authors(hash)
    p "soy un autor #{hash.first_name}"
  end

  def assign_attr(obj, state)
    obj.author = state[:authors].select { |author| author.id == o['author'] }[0]
    obj.source = state[:sources].select { |source| source.id == o['source'] }[0]
    obj.genre = state[:genres].select { |genre| genre.id == o['genre'] }[0]
    obj.label = state[:labels].select { |label| label.id == o['label'] }[0]
    obj
  end
end
