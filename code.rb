def print_time(sec)
  hours = sec / 3600
  minutes = (sec % 3600) / 60
  seconds = sec % 60
  message = String.new
  if seconds > 0
    seconds == 1 ? message = "#{seconds} second" + message : message = "#{seconds} seconds" + message
  elsif seconds == 0
    message += "0 seconds"
  end
  if minutes > 0
    minutes == 1 ? message = "#{minutes} minute, " + message : message = "#{minutes} minutes, " + message
  end
  if hours > 0
    hours == 1 ? message = "#{hours} hour, " + message : message = "#{hours} hours, " + message
  end
  return message
end

songs = [{name: '', length: -1, plays: -1, playtime: -1},{name: '', length: -1, plays: -1, playtime: -1},{name: '', length: -1, plays: -1, playtime: -1},{name: '', length: -1, plays: -1, playtime: -1}]
total_jam = 0
most_jammed = {name: '', playtime: -1}
also_jammed = {name: '', playtime: -1}
also_also_jammed = {name: '', playtime: -1}
also_also_also_jammed = {name: '', playtime: -1}
tie = 1

puts "\n---------------------
 WELCOME TO JAM TIME 
---------------------\n\n"

songs.each_with_index do |song,i|
  puts "\nSong number #{i+1}:"
  print "  Enter name of song:"
  song[:name] = $stdin.gets.chomp
  while song[:length] < 0
    print "  Enter length of song in seconds: "
    song[:length] = $stdin.gets.chomp.to_i
    if song[:length] < 0 
      puts "  ERROR: Please enter a number that is 0 or greater"
    end
  end
  while song[:plays] < 0
    print "  Enter number of times song has been played: "
    song[:plays] = $stdin.gets.chomp.to_i
    if song[:plays] < 0 
      puts "  ERROR: Please enter a number that is 0 or greater"
    end
  end
  puts "  Got it! \"#{song[:name]}\" is #{song[:length]} seconds long and has been played #{song[:plays]} times."
  song[:playtime] = song[:length] * song[:plays]
end

puts "\n---------------------"

puts "\nJam Time data for \"#{songs[0][:name]}\", \"#{songs[1][:name]}\", \"#{songs[2][:name]}\", and \"#{songs[3][:name]}\":\n"

songs.each do |song|
  puts "Time spent jamming to \"#{song[:name]}\" is #{print_time(song[:playtime])}."
  total_jam += song[:playtime] 
    if song[:playtime] > most_jammed[:playtime]
      most_jammed = song
      tie = 1
    elsif song[:playtime] == most_jammed[:playtime]
      tie += 1
      if tie == 2
        also_jammed = song
      elsif tie == 3
        also_also_jammed = song
      elsif tie == 4
       also_also_also_jammed = song
     end
    end
end

puts "\nTotal time spent jamming: #{print_time(total_jam)}"

print "\nThe song you listened to most was: "
print "\"#{most_jammed[:name]}\""
print ", tied with \"#{also_jammed[:name]}\"" if tie > 1
print ", and \"#{also_also_jammed[:name]}\"" if tie > 2
print ", and \"#{also_also_also_jammed[:name]}\"" if tie > 3
puts ", with a jam time of #{print_time(most_jammed[:playtime])}."

puts "\n---------------------"
