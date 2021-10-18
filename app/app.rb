class App
  def initialize(actions: [])
    @actions = actions
    @state = {
      books: [],
      albums: [],
      movies: [],
      games: [],
      exit: false
    }
  end

  def init
    puts '----- Welcome to the ---->'
    puts '----- Catalog of Things -----'
    stay_idle
  end

  private

  def stay_idle
    puts 'Please choose an option by entering a number:'
    puts '-----'
    @actions.each_with_index do |action, i|
      puts "#{i + 1} - #{action.name}"
    end
    number_choose = gets.chomp.to_i
    puts '-----'
    @actions[number_choose - 1].do_action(@state)
    puts '-----'

    stay_idle unless @state[:exit]
  end
end
