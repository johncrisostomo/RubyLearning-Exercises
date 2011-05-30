require 'logger'

class TextAnalyzer
  def initialize(fname)
    @log = Logger.new('TextAnalyzerClass.log', 'monthly')
    @log.progname = $0
    @text = ''
    @output = ''
    File.open(fname) do |f|
      while line = f.gets
        @text << line
      end
    end
    @log.info "New TextAnalyzer object successfully created!"
  end

  def report
    word_count = @text.split(' ').size
    sentence_count = @text.split.join('').gsub(/[\.\?\!\;]/, ' ').split(' ').size
    paragraph_count = @text.split("\n\n").size
    @output << "\nThe number of characters is #{@text.length}\n"
    @output << "The number of characters without spaces is #{@text.split.join('').length}\n"
    @output << "The number of lines is #{@text.split("\n").size}\n"
    @output << "The number of words is #{word_count}\n"
    @output << "The number of sentences is #{sentence_count}\n"
    @output << "The number of paragraphs is #{paragraph_count}\n"
    @output << "The average number of words per sentence is %.2f\n" % (word_count / sentence_count.to_f)
    @output << "The average number of sentences per paragraph is %.2f\n" % (sentence_count / paragraph_count.to_f)
  end

  def create_log
    @log.info @output
  end
end
