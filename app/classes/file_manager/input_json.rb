class InputJson
  def initialize(adress = './app/data')
    @adress = adress
    @map_hash = {
      authors: lambda { |o, _state|
        p 'hello world'
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
        new_object.author = state[:authors].select { |author| author.id == o['author'] }[0]
        new_object.source = state[:sources].select { |source| source.id == o['source'] }[0]
        new_object.genre = state[:genres].select { |genre| genre.id == o['genre'] }[0]
        new_object.label = state[:labels].select { |label| label.id == o['label'] }[0]
        new_object
      },
      games: lambda { |o, state|
        new_object = Game.new(id: o['id'], name: o['name'], date: o['date'], archived: o['archived'],
                              last_played_at: o['last_played_at'], multiplayer: o['multiplayer'])
        new_object.author = state[:authors].select { |author| author.id == o['author'] }[0]
        new_object.source = state[:sources].select { |source| source.id == o['source'] }[0]
        new_object.genre = state[:genres].select { |genre| genre.id == o['genre'] }[0]
        new_object.label = state[:labels].select { |label| label.id == o['label'] }[0]
        new_object
      },
      albums: lambda { |o, state|
        new_object = MusicAlbum.new(id: o['id'], name: o['name'], date: o['date'], archived: o['archived'],
                               on_spotify: o['on_spotify'])
        new_object.author = state[:authors].select { |author| author.id == o['author'] }[0]
        new_object.source = state[:sources].select { |source| source.id == o['source'] }[0]
        new_object.genre = state[:genres].select { |genre| genre.id == o['genre'] }[0]
        new_object.label = state[:labels].select { |label| label.id == o['label'] }[0]
        new_object
      },
      books: lambda { |o, state|
        new_object = Book.new(id: o['id'], name: o['name'], date: o['date'], archived: o['archived'],
                              publisher: o['publisher'], cover_state: o['cover_state'])
        new_object.author = state[:authors].select { |author| author.id == o['author'] }[0]
        new_object.source = state[:sources].select { |source| source.id == o['source'] }[0]
        new_object.genre = state[:genres].select { |genre| genre.id == o['genre'] }[0]
        new_object.label = state[:labels].select { |label| label.id == o['label'] }[0]
        new_object
      }
    }
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
    arr = hashes.map { |hash| p @map_hash[file.to_sym].call(hash, state) }
    state[file.to_sym].concat(arr)
  end

  def build_authors(hash)
    p "soy un autor #{hash.first_name}"
  end
end
