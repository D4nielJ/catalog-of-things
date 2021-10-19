require 'fileutils'
require 'json'

class OutputJson
  def initialize(adress = './app/data')
    @adress = adress
  end

  def create_files
    Dir.mkdir(@adress) unless Dir.exist?(@adress)
    create_multiple_files(%w[authors genres labels sources movies games music_albums books])
  end

  private

  def create_single_file(file)
    FileUtils.touch("#{@adress}/#{file}.json") unless File.exist?("#{@adress}/#{file}.json")
  end

  def create_multiple_files(arr_files)
    arr_files.each { |f| create_single_file(f) }
  end
end
