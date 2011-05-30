def document_to_string(filename)
  text = ''
  File.open(filename) do |f|
    while line = f.gets
      text << line
    end
  end
  text
end

def get_character_count(text)	
  text.length
end

def get_character_count_without_spaces(text)
  text.gsub(/ /,'').length
end

def get_line_count(text)
  text.split("\n").size
end

def get_word_count(text)
  words = text.split(' ')
  words.size
end

def get_sentence_count(text)
  sentences = text.gsub(/ /,'')
  no_punctuations = sentences.gsub(/[\.\?\!\;]/, ' ')
  no_punctuations.split(' ').size
end

def get_paragraph_count(text)
  text.split("\n\n").size
end

def calculate_average_number_of_words_per_sentence(words, sentences)
  words/sentences.to_f
end

def calculate_average_number_of_sentences_per_paragraph(sentences, paragraphs)
  sentences/paragraphs.to_f
end

print "Enter filename : "
fname = gets.chomp!
sample = document_to_string(fname)
average_words = calculate_average_number_of_words_per_sentence(get_word_count(sample), get_sentence_count(sample.gsub(/\n/, '')))
average_sentences = calculate_average_number_of_sentences_per_paragraph(get_sentence_count(sample.gsub(/\n/, '')), get_paragraph_count(sample))
puts "Analyzing #{fname} . . .\n"
puts "The number of characters is #{get_character_count(sample)}"
puts "The number of characters (without spaces) is #{get_character_count_without_spaces(sample.gsub(/\n/, ''))}"
puts "The number of lines is #{get_line_count(sample)}"
puts "The number of words is #{get_word_count(sample)}"
puts "The number of sentences is #{get_sentence_count(sample.gsub(/\n/, ''))}"
puts "The number of paragraphs is #{get_paragraph_count(sample)}"
puts "The average number of words in a sentence is %.2f" % average_words
puts "The average number of sentences in a paragraph is %.2f" % average_sentences
