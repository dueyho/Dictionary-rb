require 'rspec'
require 'Dictionary'
require 'dictionary_ui'

describe Term do
  before do
    Term.clear
  end

  it 'is initialized with word' do
    test_term = Term.new('cup', 'holds liquids')
    test_term.should be_an_instance_of Term
  end

  it 'defines the word' do
    test_term = Term.new('cup','holds liquids')
    test_term.word.should eq 'cup'
    test_term.definition.should eq 'holds liquids'
  end

  describe '.create' do
    it 'creates a new term' do
      test_term = Term.create('cup','holds liquids')
      Term.all[0].word.should eq 'cup'
    end
  end
  describe '.all' do
    it 'shows all the terms' do
      test_term = Term.create('cup', 'holds liquids')
      Term.all.should eq [test_term]
    end
  end
  describe '.list' do
    it 'list all the words' do
      test_term = Term.create('cup', 'holds liquids')
      test_term2 = Term.create('mug', 'holds coffee')
      Term.list.should eq ['cup','mug']
    end
  end
end



# Start with a class called Term,
# that has instance variables for word
#  and definition. For example,
#  Term.new('carrot', 'A delicious vegetable.').
#  In your user interface, build ways to create terms,
#   list the words, show their definition, edit them,
#    and delete them.
