require './lib/term'

def main_menu
  puts "Welcome!"
  puts "Press 'c' to input a new word and definition"
  puts "Press 'l' to list all your words"
  puts "Press 'ld' to list all the definitions"
  puts "Press 'e' to edit a term"
  puts "Press 'd' to delete a term"
  puts "Press 'x' to exit"
  choice = gets.chomp
  case choice
    when 'c' then create_term
    when 'l' then list_words
    when 'ld'then list_definitions
    when 'e' then edit_term
    when 'd' then delete_term
    when 'x' then puts "Goodbye!"
    else
      puts "That is not valid"
      main_menu
  end
end

def create_term
  puts "Enter the word"
  word = gets.chomp "\n"
  puts "Enter the definition"
  definition = gets.chomp "\n"
  new_term = Term.create(word, definition)
  puts new_term
  puts "#{new_term.word}: #{new_term.definition} entered!" "\n"
  main_menu
end

def list_words
  Term.all.each do |term|
    puts term.word
  end
  main_menu
end

def list_definitions
  Term.all.each do |term|
    puts term.definition
  end
  main_menu
end

def edit_word
  puts "What word do you want to edit?"
  wrong_word = gets.chomp
  puts "What should replace that word?"
  fixed_word = gets.chomp
  Term.all.each do |x|
    if x.word == wrong_word
    x.word.replace(fixed_word)
    puts "I replaced #{wrong_word} with #{x.word}"
    main_menu
    end
  end
end

def edit_definition
  puts "What word's definition do you want to edit?"
  wrong_word = gets.chomp
  puts "What should replace that definition?"
  fixed_definition = gets.chomp
  Term.all.each do |x|
    if x.word == wrong_word
    x.definition.replace(fixed_definition)
    puts "I replaced the definition of #{wrong_word} to #{x.definition}"
    main_menu
    end
  end
end

def edit_term
  puts "Would you like to edit the word 'w' or the definition 'd'?"
    w_or_d = gets.chomp
  case w_or_d
  when 'w' then edit_word
  when 'd' then edit_definition
  else
    puts "That is not a valid option, choose again"
    edit_term
  end
end

def delete_term
  puts "If you're sure you want to delete a term find the number below:"
  Term.all.each_with_index do |term, index|
    puts "#{index + 1}, #{term.word}: #{term.definition}"
  end
    puts "Enter the number here:"
    dead_number = gets.chomp.to_i
    delete = Term.all.delete_at(dead_number - 1)
    puts "\n\n#{delete.word} removed from your dictionary.\n"
    main_menu
end
main_menu
