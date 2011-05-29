## This is the same as the first analyzer, but with validation and logging included.

require 'logger'

class TextAnalyzer
  attr_reader :characters, :characters_without_spaces, :line_count, :word_count, :sentence_count, :paragraph_count,
    :average_words_per_sentence, :average_sentences_per_paragraph
  def initialize(fname)
   @text = ''
    File.open(fname) do |f|
      while line = f.gets
        @text << line
      end
    end
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
end

## sample implementation
$LOG = Logger.new("analyzer.log", "monthly")
$LOG.progname = __FILE__

def create_analyzer_object
  begin 
    print "Enter filename : "
    fname = gets.chomp!
    $LOG.debug "Trying to initialize object with file : #{fname}..."
    TextAnalyzer.new(fname)
    rescue Exception => e
      $LOG.error "Object initialization failed! - #{e}"
      puts "#{e}"
      create_analyzer_object
  end
end

ta = create_analyzer_object
$LOG.debug "TextAnalyzer object successfully created!"
puts "The number of characters is #{ta.characters}"
$LOG.debug "The number of characters is #{ta.characters}" 
puts "The number of lines is #{ta.line_count}"
$LOG.debug "The number of lines is #{ta.line_count}"
puts "The number of words is #{ta.word_count}"
$LOG.debug "The number of words is #(ta.word_count}" 
puts "The number of sentences is #{ta.sentence_count}"
$LOG.debug "The number of sentences is #{ta.sentence_count}"
puts "The number of paragraphs is #{ta.paragraph_count}"
$LOG.debug "The number of paragraphs is #{ta.paragraph_count}" 
puts "The average number of words per sentence is %.2f" % ta.average_words_per_sentence
$LOG.debug "The average number of words per sentence is %.2f" % ta.average_words_per_sentence
puts "The average number of sentences per paragraph is %.2f" % ta.average_sentences_per_paragraph
$LOG.debug "The average number of sentences per paragraph is %.2f" % ta.average_sentences_per_paragraph
