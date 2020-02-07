class SonnetGenerator::CLI
  
  @@name = ""
  
  def call
    puts "Welcome to The Sonnet Generator."
    puts "What is thy name?"
      name = gets.strip.capitalize
      @@name << name
    puts "Dearest #{name}, which poet wouldst thou like to draw inspiration from?"
    puts "To exit The Sonnet Generator, enter 'adieu'"
    menu
  end
  
  def menu
    input = gets.strip.downcase
    if input == "poet"
      poet_list
      menu
    elsif input == "adieu"
      goodbye
    else
      invalid_entry
    end
  end
  
  def invalid_entry
      puts "Invalid entry. Please try again."
      menu
  end
  
  def poet_list
    puts "1. Shakespeare"
    puts "2. Williams"
    puts "3. Payton"
    puts "4. Longfellow"
  end
  
  def goodbye
    puts "Adieu, #{@@name}. Till next time."
  end
  
end
