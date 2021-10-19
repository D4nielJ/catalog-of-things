class App
  def initialize(actions: [], state_manager: nil)
    @actions = actions
    @state = {
      books: [],
      albums: [],
      movies: [],
      games: [],
      genres: [],
      sources: [],
      authors: [],
      labels: [],
      exit: false
    }
    @state_manager = state_manager
  end

  def init
    @state_manager&.fetch(@state)
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

    return exit if @state[:exit]

    stay_idle
  end

  def exit
    @state_manager.save(@state)
  end
end
