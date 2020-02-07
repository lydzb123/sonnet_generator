class SonnetGenerator::CLI
  
  @@name = ""
  
  def call
    puts "Welcome to The Sonnet Generator."
    puts "What is thy name?"
      name = gets.strip.capitalize
      @@name << name
    puts "Dearest #{name}, doth thou desire a canton? Enter 'Yes' or 'No'"
    puts "To exit The Sonnet Generator, enter 'adieu'"
    menu
  end
  
  def menu
    input = gets.strip.downcase
    if input == "yes"
      poet_list
      menu
    elsif input == "no" || input == "adieu" 
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
    puts "Which poet wouldst thou like to draw inspiration from?"

puts"             _______________________"
puts"           =(__    ___      __     _)="
puts"             |                     |"
puts"             |                     |"
puts"             |    1. Shakespeare   |"
puts"             |    2. Williams      |"
puts"             |    3. Payton        |"
puts"             |    4. Longfellow    |"
puts"             |                     |"
puts"             |                     |"
puts"             |                     |"
puts"             |__    ___   __    ___|"
puts"           =(_______________________)="
           
           
          
    input = gets.strip.downcase
    poet_selection(input)
  end
  
  def poet_selection(poet)
    puts "#{poet}"
    #go over array and find starship
  end
  
  def goodbye
    puts "Adieu, #{@@name}. Till next time."
  end
  
end
