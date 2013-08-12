class Phrase

  attr_reader :storage

  def initialize(phrase)
    @storage = WordStorage.new(parse(phrase))
  end

  def word_count
    storage.word_count
  end

  def parse(phrase)
    phrase.
      gsub(/(?!,)[[:punct:]\^$]/, '').
      gsub(/\s+/, ' ').
      gsub(/\s+/, ',').
      split(',').
      delete_if { |entry| entry.empty? }.map { |word| word.downcase }
  end

end

class WordStorage

  def initialize(words)
    @words = save(words)
  end

  def word_count
    storage
  end

  def save(words)
    words.each { |word| store(word) }
  end

  def store(word)
    storage[word] = if storage.has_key?(word)
                      storage[word] + 1
                    else
                      1
                    end
  end

  def storage
    @storage ||= {}
  end

end
