module InputModule
  Show_Prompt = lambda do |required_params, message = '', *args, validator: nil|
    puts message
    temp_args = {}
    required_params.each do |param|
      puts "Enter #{param}"
      input = gets.strip.to_s
      temp_args.merge!(param => input)
    end
    valid = !validator.nil? && validator.call(*args)
    p temp_args
    p valid
    valid == false ? temp_args : temp_args.merge!(valid)
  end

  Show_Prompt_With_Callback = lambda do |required_params, message = '', *args, callback:|
    result = nil
    loop do
      puts message
      op = Show_Prompt.call(required_params)
      result = callback.call(*args, op[:index].to_i)
      break if result
    end
    result
  end

  Get_By_Index = lambda do |collection, index|
    return collection[index - 1] unless collection[index - 1].nil? || index.negative?

    puts
    puts '**** INVALID INDEX TRY AGAIN ****'
    puts
    false
  end

  Valid_Boolean = lambda do |args|
    temp_args = {}
    args.each do |param|
      input = ''
      loop do
        puts "Enter[y/n] #{param}"
        input = gets.strip.to_s
        break if %w[y n Y N].include?(input)
      end
      temp_args.merge!(param => input.capitalize == 'Y')
    end
    temp_args
  end
end
