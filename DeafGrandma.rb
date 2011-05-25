#only quits after three successive BYEs

def random_year
  rand(21) + 1930
end

count = 0
while count <= 2
  print 'Say something to grandma : ' 
  input = gets.chomp
  count += 1 if input == 'BYE'
  count = 0 if input != 'BYE'
  unless input == input.upcase
    puts 'Grandma responds: HUH?! SPEAK UP, SONNY!'
  else
    puts "Grandma responds: NO, NOT SINCE #{random_year}!"
  end
end
