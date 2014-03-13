require 'rspec'
require 'term'
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

  describe '.search' do
    it 'searches the terms and returns the right definition' do
      test_term = Term.create('mug', 'holds coffee')
      Term.search('mug').should eq test_term
    end
  end
end
  # describe '#update_word' do
  #   it 'changes the word' do
  #     test_term = Term.create('whatever', 'lalala')
  #     test_term.update_word('new_word')
  #     test_term.word.should eq 'new_word'
  #   end
  # end

