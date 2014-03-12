require './lib/Dictionary'

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
    when 'c'
      create_term
    when 'l'
      list_words
    when 'ld'
      list_definitions
    when 'e'
      edit_term
    when 'd'
      delete_term
    when 'x'
      puts "Goodbye!"
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
  when 'w'
    edit_word
  when 'd'
    edit_definition
  else
    puts "That is not a valid option, choose again"
    edit_term
  end
end

main_menu
