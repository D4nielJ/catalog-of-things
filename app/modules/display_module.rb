module DisplayModule
  Type = Struct.new(:name, :required_params)

  get_instance_value = ->(label, obj) { obj.respond_to?(label) ? obj.send(label) : 'None' }

  max_string_length = lambda do |collection, labels|
    max = 0
    collection.each do |obj|
      labels.each do |label|
        get_instance_value.call(label, obj).to_s.length > max && max = get_instance_value.call(label, obj).to_s.length
      end
    end
    return max
  end

  List_Collection = lambda do |collection, table_title, labels, behaviour, *options|
    behaviour.call(collection, table_title, labels, *options)
  end

  Display_Table = lambda do |collection, title, labels|
    # Clear_Display.call
    max = max_string_length.call(collection, labels)
    temp_string = '#..'
    labels.each { |label| temp_string += " #{label.to_s.capitalize.ljust(max + 2, '.')}" }

    puts "Total number of #{title}: #{collection.count}"
    puts
    puts temp_string
    puts

    collection.each_with_index do |obj, index|
      temp_string = "#{index + 1}.."
      labels.each { |label| temp_string += " #{get_instance_value.call(label, obj).to_s.ljust(max + 2, '.')}" }
      puts temp_string
    end
    puts
  end

  Display_All = lambda do |collection, title, labels|
    table = collection.map do |res|
      temp = Object.new
      class << temp
        attr_accessor :name, :author, :label, :date, :genre
      end
      temp.genre = res.genre.name
      temp.label = res.label.title
      temp.date = res.date
      temp.author = res.author.first_name
      temp
    end
    Display_Table.call(table, title, labels)
  end
  Clear_Display = -> { system('clear') || system('cls') }
end
