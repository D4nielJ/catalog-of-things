class InputJson
  @assign_attr = lambda { |new_obj, o, state|
    new_obj.author = state[:authors].select { |author| author.id == o['author'] }.first
    new_obj.source = state[:sources].select { |source| source.id == o['source'] }.first
    new_obj.genre = state[:genres].select { |genre| genre.id == o['genre'] }.first
    new_obj.label = state[:labels].select { |label| label.id == o['label'] }.first
    new_obj
  }

  MAP_HASH = {
    authors: lambda { |o, _state|
      Author.new(id: o['id'], first_name: o['first_name'], last_name: o['last_name'])
    },
    genres: lambda { |o, _state|
      Genre.new(id: o['id'], name: o['name'])
    },
    labels: lambda { |o, _state|
      Label.new(id: o['id'], title: o['title'], color: o['color'])
    },
    sources: lambda { |o, _state|
      Source.new(id: o['id'], name: o['name'])
    },
    movies: lambda { |o, state|
      new_object = Movie.new(id: o['id'], name: o['name'], date: o['date'], archived: o['archived'],
                             silent: o['silent'])
      @assign_attr.call(new_object, o, state)
    },
    games: lambda { |o, state|
      new_object = Game.new(id: o['id'], name: o['name'], date: o['date'], archived: o['archived'],
                            last_played_at: o['last_played_at'], multiplayer: o['multiplayer'])
      @assign_attr.call(new_object, o, state)
    },
    albums: lambda { |o, state|
      new_object = MusicAlbum.new(id: o['id'], name: o['name'], date: o['date'], archived: o['archived'],
                                  on_spotify: o['on_spotify'])
      @assign_attr.call(new_object, o, state)
    },
    books: lambda { |o, state|
      new_object = Book.new(id: o['id'], name: o['name'], date: o['date'], archived: o['archived'],
                            publisher: o['publisher'], cover_state: o['cover_state'])
      @assign_attr.call(new_object, o, state)
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

  def fetch_file(file, state)
    json = File.read("#{@adress}/#{file}.json")
    hashes = JSON.parse(json)
    arr = hashes.map { |hash| p @map_hash[file.to_sym].call(hash, state) }
    state[file.to_sym].concat(arr)
  end
end
