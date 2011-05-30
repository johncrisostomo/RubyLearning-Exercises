## This is the same as the first analyzer, but with validation and logging included.

require 'logger'

class TextAnalyzer
  attr_reader :characters, :characters_without_spaces, :line_count, :word_count, :sentence_count, :paragraph_count,
    :average_words_per_sentence, :average_sentences_per_paragraph
  def initialize(fname)
    @log = Logger.new('TextAnalyzerClass.log', 'monthly')
    @log.progname = $0
    @text = ''
    File.open(fname) do |f|
      while line = f.gets
        @text << line
      end
    end
    @log.debug "New TextAnalyzer object successfully created!"
  end

  def characters
    @text.length
  end

  def characters_without_spaces  
    @text.split.join('').length
  end
  
  def line_count 
    @text.split("\n").size
  end

  def word_count 
    @text.split(' ').size
  end

  def sentence_count  
    @text.split.join('').gsub(/[\.\?\!\;]/, ' ').split(' ').size
  end
  
  def paragraph_count 
    @text.split("\n\n").size
  end

  def average_words_per_sentence 
    self.word_count/self.sentence_count.to_f
  end

  def average_sentences_per_paragraph 
    self.sentence_count / self.paragraph_count.to_f
  end

  def report
    @log.debug "The number of characters is #{self.characters}" 
    @log.debug "The number of lines is #{self.line_count}"
    @log.debug "The number of words is #{self.word_count}" 
    @log.debug "The number of sentences is #{self.sentence_count}"
    @log.debug "The number of paragraphs is #{self.paragraph_count}"
    @log.debug "The average number of words per sentence is %.2f" % self.average_words_per_sentence
    @log.debug "The average number of sentences per paragraph is %.2f" % self.average_sentences_per_paragraph
  end
end

