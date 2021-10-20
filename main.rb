require 'json'
require_relative 'app/app'
require_relative 'app/classes/index'
require_relative 'app/actions/index'

def main
  app = App.new(
    state_manager: FileManager.new,
    actions: [
      ListAllBooks.new, ListAllAlbums.new, ListAllGames.new, ListAllMovies.new,
      ListAllGenres.new, ListAllAuthors.new, ListAllSources.new, ListAllLabes.new,
      CreateAlbum.new, CreateBook.new, CreateMovie.new, CreateGame.new,
      CreateAuthor.new, CreateLabel.new, CreateSource.new, CreateGenre.new,
      Exit.new
    ]
  )
  app.init
end

main
