require 'fileutils'

class OutputJson
  def initialize(adress = './app/data')
    @adress = adress
  end

  def create_files
    Dir.mkdir(@adress) unless Dir.exist?(@adress)
    create_multiple_files(%w[authors genres labels sources movies games albums books])
  end

  def save_files(state)
    save_multiple_files(%w[authors genres labels sources movies games albums books], state)
  end

  private

  def save_single_file(file, state)
    arr_of_hash = state[file.to_sym].map(&:to_hash)
    arr_json = JSON.pretty_generate(arr_of_hash)
    File.open("#{@adress}/#{file}.json", 'w') { |f| f.write arr_json }
  end

  def save_multiple_files(arr_files, state)
    arr_files.each { |f| save_single_file(f, state) }
  end

  def create_single_file(file)
    FileUtils.touch("#{@adress}/#{file}.json") unless File.exist?("#{@adress}/#{file}.json")
  end

  def create_multiple_files(arr_files)
    arr_files.each { |f| create_single_file(f) }
  end
end
