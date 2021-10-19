class InputJson
  def initialize(adress = './app/data')
    @adress = adress
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
    arr = hashes.map { |hash| "build_#{file}".to_sym(hash) }
    p state[file.to_sym].concat(arr)
  end

  def build_authors(hash)
    p "soy un autor #{hash.first_name}"
  end
end
