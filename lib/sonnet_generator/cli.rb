class SonnetGenerator::CLI
  
  def call
    puts ""
    puts ""
    puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    puts "Welcome to The SHAKESPEAREAN Sonnet Generator!"
    puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    puts ""
    puts "Enter your name to get started OR 'Exit' to leave."
    @name = gets.upcase
    API.get_data
    puts ""
    puts "Dearest #{@name}, doth thou desire a canton?"
    puts "Enter 'R' for a Random Sonnet | 'C' for a Custom Poem | 'No' for no poem"
    puts ""
    menu
  end

  def menu
    input = gets.strip.downcase
    if input == "r"
      random_sonnet
    elsif input == "c"
      custom_poem("#{@name}")
    elsif input == "no" || input == "exit"
      goodbye
    else
      invalid_entry
    end
  end

  def random_sonnet
    random_sonnet = Sonnet.all.sample
    puts ""
    puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    puts "Here is Shakespeare's #{random_sonnet.title.colorize(:light_blue)}"
    puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    puts ""
    sleep(1)
    random_sonnet.lines.each_with_index do |line, index|
      puts "#{index + 1}. #{line.strip}"
      sleep(1)
    end
  end

  def custom_poem(name)
    puts ""
    puts "  To the fairest, #{@name}..."
    puts "  Here is a custom poem just for you!"
    sleep(1)
    puts ""
    new_poem_directory = []
    parsed_name = name.gsub(/\s+/, "").upcase.split("")

    parsed_name.each do |letter|

      Sonnet.lines.shuffle.find do |line|
        if letter == line[0]
          new_poem_directory << line
        end
      end
    end

    poem_intro_details
    sleep(1)
    print_poem(new_poem_directory)
    sleep(1)
    poem_details
    sleep(1)
    sub_menu
  end



  def print_poem(poem_array)
    poem_array.each do |line| puts "  #{line[0].colorize(:light_blue)} #{line}"
    sleep(1)
  end
  end

  def poem_size
    if @name.gsub(/\s+/, "").size < 14
      puts "Your poem is just #{(14 - @name.gsub(/\s+/, "").size)} lines shy of being a sonnet!"
    elsif @name.gsub(/\s+/, "").size > 14
      puts "Sonnets are comprised of 14 lines. Your poem is #{(14 - @name.gsub(/\s+/, "").size).abs} lines a bit too long!"
    else
      puts "Awesome. Your custom poem is 14 lines, just as a standard should be!"
    end
    sleep(1)
  end

  def poem_intro_details
    puts ""
    puts "Title: #{@name}"
    puts "Linecount: #{@name.gsub(/\s+/, "").size}"
    puts ""
  end

  def poem_details
    puts ""
    poem_size
    puts "Your poem is comprised of lines from: "
    puts ""

  end
  



  def goodbye
    puts "Adieu, #{@name}. Till next time."
  end
  
  def invalid_entry
      puts ""
      puts "Invalid entry. Please try again."
      menu
  end
  
  
  def sub_menu
    puts ""
    puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    puts "To learn more about your custom sonnet, type 'View'"
    puts "To generate a new poem, type 'New'"
    puts "To exit, type 'Adieu'"
    sub_input = gets.strip.downcase

    if sub_input == "view"
      learn_more
    elsif sub_input == "new"
      generate_poem(@name)
    elsif sub_input == "adieu"
      goodbye
    else
      invalid_entry
    end
  end
  
  def learn_more
    puts "Your custom sonnet is comprised of Shakespeare's Sonnets: List of Sonnets"
    puts " To read the original Sonnet, type in the sonnet number (i.e. 1, 2, 3)"
    
  end
  

  
end
