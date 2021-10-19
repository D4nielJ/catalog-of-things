require_relative 'input_json'
require_relative 'output_json'

class FileManager
  def initialize(adress: './app/data', input: InputJson, output: OutputJson)
    @adress = adress
    # @input = input.new(@adress)
    @output = output.new(@adress)
  end

  def fetch(state); end

  def save(state)
    @output.create_files
    @output.save_files(state)
  end
end
