class Phrase

  attr_reader :storage

  def initialize(phrase)
    words = WordScanner.scan(phrase)
    @storage = WordStorage.new(words)
  end

  def word_count
    storage.words
  end

end

module WordScanner

  def self.scan(phrase)
    phrase.scan(/\w+/).map(&:downcase)
  end

end

class WordStorage

  WORD_INC_COUNT = 1

  def initialize(words)
    @words = save(words)
  end

  def words
    storage
  end

  private

  def save(words)
    words.each { |word| store(word) }
  end

  def store(word)
    storage[word] = if storage.has_key?(word)
                      storage[word] + WORD_INC_COUNT
                    else
                      WORD_INC_COUNT
                    end
  end

  def storage
    @storage ||= {}
  end

end
