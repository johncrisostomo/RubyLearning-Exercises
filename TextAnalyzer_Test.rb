require_relative 'analyzer2'
require 'logger'

## sample implementation
$LOG = Logger.new("analyzer.log", "monthly")
$LOG.progname = "jdcrisostomo_analyzer"

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
$LOG.debug "Object initialization successful."
puts "The number of characters is #{ta.characters}"

puts "The number of lines is #{ta.line_count}"

puts "The number of words is #{ta.word_count}"

puts "The number of sentences is #{ta.sentence_count}"

puts "The number of paragraphs is #{ta.paragraph_count}"

puts "The average number of words per sentence is %.2f" % ta.average_words_per_sentence

puts "The average number of sentences per paragraph is %.2f" % ta.average_sentences_per_paragraph

ta.report
