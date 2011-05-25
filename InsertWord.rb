def open_file_and_getlines(filename)
  lines = []
  File.open(filename) do |f|
    lines = f.readlines
  end
  lines
end

def seek_target_word(lines, word)
  pos = -1
  lines.each_with_index do |line, index|
    pos = index if line.split(" ").include?(word)
  end
  pos
end

def insert_new_word(lines, word, new_word, pos)
  target = -1
  lines[pos].split(" ").each_with_index do |element, index|
	   target = index if element == word
  end
  lines[pos] =  lines[pos].split.to_a.insert(target, new_word).join(" ")
  lines
end

def replace_file_contents(filename, lines)
  File.open(filename, "w+") do |f|
    lines.each do |line|
      f.puts line
    end
  end
end

print "Enter filename : "
fname = gets.chomp!
print "Enter target word : "
word = gets.chomp!
print "Enter word to be inserted : "
new_word = gets.chomp!
target_position = seek_target_word(open_file_and_getlines(fname), word)
if target_position >= 0
  modded_lines = insert_new_word(open_file_and_getlines(fname), word, new_word, target_position) 
  replace_file_contents(fname, modded_lines)
else
  puts "Word not found!"
end
