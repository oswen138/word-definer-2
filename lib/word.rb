class Word
  attr_reader :id, :word_input
  attr_accessor :word_input

  @@words = {}
  @@total_rows = 0

  def initialize(word_input, id)
    @word_input = word_input
    @id = id || @@total_rows +=1
  end

  def self.all
    @@words.values()
  end

  def self.sort
    array_of_words = @@words.values
    return array_of_words.sort_by {|obj| obj.word_input}
  end

  def save
    @@words[self.id] = Word.new(self.word_input, self.id)
  end

  def ==(word_to_compare)
    self.word_input() == word_to_compare.word_input()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end
 
  def self.find(id)
    @@words[id]
  end

  def update(word_input)
    self.word_input = word_input
    @@words[self.id] = Word.new(self.word_input, self.id)
  end

  def delete
    @@words.delete(self.id)
  end

  def definitions
    Definition.find_by_word(self.id)
  end
end

