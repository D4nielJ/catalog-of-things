class InputJson
  def initialize(adress = './app/data')
    @adress = adress
    @map_hash = {
      authors: lambda { |o|
        Author.new(id: o['id'], first_name: o['first_name'], last_name: o['last_name'])
      },
      genres: lambda { |o|
        Genre.new(id: o['id'], name: o['name'])
      },
      labels: lambda { |o|
        Label.new(id: o['id'], title: o['title'], color: o['color'])
      },
      source: lambda { |o|
        Source.new(id: o['id'], name: o['name'])
      },
      movies: lambda { |o|
        Movie.new(id: o['id'], name: o['name'], date: o['date'], archived: o['archived'], silent: o['silent'])
      },
      games: lambda { |o|
        Author.new(id: o['id'], first_name: o['first_name'], last_name: o['last_name'])
      },
      albums: lambda { |o|
        Author.new(id: o['id'], first_name: o['first_name'], last_name: o['last_name'])
      },
      books: -lambda { |o|
        Author.new(id: o['id'], first_name: o['first_name'], last_name: o['last_name'])
      },
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
    # arr = hashes.map { |hash| "build_#{file}".to_sym(hash) }
    arr = hashes.map { |hash| @map_hash[file.to_sym].call(hash) }
    p arr
    state[file.to_sym].concat(arr)
  end

  def build_authors(hash)
    p "soy un autor #{hash.first_name}"
  end
end
