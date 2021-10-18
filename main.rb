require_relative 'app/app'
require_relative 'app/classes/index'
require_relative 'app/actions/index'

def main
  app = App.new(
    actions: [
      ListAllBooks.new,
      Exit.new
    ]
  )
  app.init
end

main
