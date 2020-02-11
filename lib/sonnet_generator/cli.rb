class SonnetGenerator::CLI
  
  @@name = ""
  
  def call
    puts "Welcome to The Shakespearean Sonnet Generator!"
    puts "Enter your name to proceed OR 'Adieu' shall you ever need to exit"
      name = gets.strip.capitalize
      @@name << name
    puts "Dearest #{name}, doth thou desire a canton? Enter 'Yes' or 'No'"
    menu
  end
  
  def menu
    input = gets.strip.downcase
    if input == "yes"
      generate_poem(@@name)
    elsif input == "no" || input == "adieu" || input == "exit"
      goodbye
    else
      invalid_entry
    end
  end
  
    def goodbye
    puts "Adieu, #{@@name}. Till next time."
  end
  
  def invalid_entry
      puts "Invalid entry. Please try again."
      menu
  end
  
  def generate_poem(name)
    puts "To the fairest, #{@@name}..."
    puts "POEM"
      puts "POEM"
        puts "POEM"
          puts "POEM"
            puts "POEM"
    sub_menu
  end
  
  
  def sub_menu
    puts "-------------------------------------------------------"
    puts "To learn more about your custom sonnet, type 'View'"
    puts "To generate a new poem, type 'New'"
    puts "To exit, type 'Adieu'"
    sub_input = gets.strip.downcase

    if sub_input == "view"
      learn_more
    elsif sub_input == "new"
      generate_poem(@@name)
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
