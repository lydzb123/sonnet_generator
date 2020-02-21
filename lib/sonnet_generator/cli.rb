class SonnetGenerator::CLI
  
#******************************** HELPER METHODS ********************************

  def padding
    puts ""
  end

  def sleeper
    sleep(1)
  end

  def goodbye
    padding
    puts "Adieu, #{@name}. Until next time.".colorize(:light_blue).bold
    sleep(2)
    system "clear"
  end
  
  def invalid_entry
      padding
      puts "Invalid entry. Please try again."
      menu
  end
  

#******************************** INTRO PROMPT + INPUT/MENU ********************************

  def call
    system "clear"

    padding
    puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    puts "Welcome to The SHAKESPEAREAN Sonnet Generator!"
    puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    padding

    puts "Enter your name to get started | Type 'X' to leave."
    @name = gets
    @name = @name.chomp

    API.get_data

    padding
    padding

    if @name.downcase == "x"
      puts "Adieu. Until next time.".colorize(:light_blue).bold
      sleep(1)
      system "clear"

    else
    puts "Dearest #{@name.colorize(:light_blue).gsub('\n','')}, doth thou desire a canton?"
    puts "Type 'R' for a Random Sonnet | Type 'C' for a Custom Poem"
    padding
    menu
    end
  end
  
 
  def menu
    input = gets.strip.downcase
    if input == "r"
      random_sonnet
    elsif input == "c"
      custom_poem("#{@name}")
    elsif input == "x"
      goodbye
    else
      invalid_entry
    end
  end


  #******************************** RANDOM SONNET + SUBMENU ********************************

  def random_sonnet
    system "clear"

    random_sonnet = Sonnet.all.sample

    padding
    puts "Here is a randomly chosen Shakespearean Sonnet!".colorize(:light_blue).bold
    sleeper

    puts "#{random_sonnet.title}"
    padding

    sleeper
    
    random_sonnet.lines.each_with_index do |line, index|
      puts "  #{line.strip}"

    end
    sleeper
    menu_message(false)

  end


  def call_on_menu

    padding
    puts "Type 'R' for another Random Sonnet | Type 'C' for a Custom Poem"
    puts "Type 'X' to leave."
    padding

  end


  def menu_message(menu_type)
    if menu_type == true

      padding
      padding

      sleeper
      puts "Type 'V' to view the details of your unique poem!"
      call_on_menu
      sub_menu
    else
      call_on_menu
      sub_menu
    end
  end


  def sub_menu
    sub_input = gets.strip.downcase

    if sub_input == "v"
      poem_details
    elsif sub_input == "c"
      custom_poem(@name)
    elsif sub_input == "r"
      random_sonnet
    elsif sub_input == "x"
      goodbye
    else
      invalid_entry
    end
  end


#******************************** CUSTOM POEM ********************************

  def custom_poem(name)
    system "clear"
    padding
    puts "To the fairest, #{@name}."
    puts "Here is a custom poem just for you!".colorize(:light_blue).bold
    padding

    @new_poem_directory = []
    parsed_name = name.gsub(/\s+/, "").upcase.split("")

    parsed_name.each do |letter|
      Sonnet.lines.shuffle.find do |line|
        if letter == line[0]
          @new_poem_directory << line
        end
      end
    end

    poem_intro_details
    sleeper
    print_poem(@new_poem_directory)
    menu_message(true)
  end


  def print_poem(poem_array)
    poem_array.each do |line| puts "  #{color_letters(line)}"
    end
  end


  def color_letters(string)
    return (string[0].colorize(:light_blue).bold + string.partition("#{string[0]}")[-1])
  end


  def poem_size
    puts "  Linecount: #{@name.gsub(/\s+/, "").size}"
    if @name.gsub(/\s+/, "").size < 14
      puts "  Your poem is #{(14 - @name.gsub(/\s+/, "").size)} lines shy of being a sonnet!"
    elsif @name.gsub(/\s+/, "").size > 14
      puts "  Sonnets are comprised of 14 lines. Your poem is #{(14 - @name.gsub(/\s+/, "").size).abs} lines a bit too long!"
    else
      puts "  Awesome. Your custom poem is 14 lines, just as a standard should be!"
    end
    sleeper
    menu_message(false)
  end


  def poem_intro_details
    padding
    puts "  Title: #{@name.colorize(:light_blue)}"
    padding
  end


  def poem_details
    padding
    poem_size
    sleeper
    padding
  end

  


    

end
