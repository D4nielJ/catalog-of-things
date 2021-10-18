class Menu
  include Observable
  attr_accessor :all_options

  Option = Struct.new(:desc, :ref)

  def initialize
    @all_options = [
      Option.new('List all books', :list_all_books),
      Option.new('List all music albums', :list_all_music_albums),
      Option.new('List all movies', :list_all_movies),
      Option.new('List all genres (e.g \'Comedy\', \'Thriller\')', :list_all_generes),
      Option.new('List all authors (e.g. \'Stephen King\')', :list_all_authors),
      Option.new('List all sources (e.g. \'From a friend\', \'Online shop\')', :list_all_sources),
      Option.new('Add a book', :add_a_book),
      Option.new('Add a music album', :add_music_album),
      Option.new('Add a movie', :add_movie),
      Option.new('Add a game', :add_game),
      Option.new('Exit', :exit)
    ]
  end

  def exit
    p 'Good bye!'
  end

  def display_menu
    puts 'Select an option by writing its number'
    all_options.each_with_index do |op, index|
      p "#{index + 1} #{op.desc}"
    end
  end

  def start
    loop do
      display_menu
      user_input = gets.chomp.to_i

      next if user_input > all_options.length

      op = all_options[user_input - 1].ref
      changed
      notify_observers(op)

      break if user_input >= all_options.size
    end
  end
end
