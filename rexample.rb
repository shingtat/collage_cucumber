def findAverage(fileName)
  #total sum of all areas
  sum = 0;
  #even counter
  counter = 0;
  #everyTwo will reset to 1
  everyTwo = 1;
  #keeps track of total elements by two
  num = 0;
  #line counter
  linecounter = 0
  fWidth = 0;
  fHeight = 0;
  File.open(fileName).each do |line|
    if linecounter == 0
      fWidth = line.to_f
    elsif linecounter == 1
      fHeight = line.to_f
    else
      everyTwo = everyTwo.to_f * line.to_f;
      counter = counter+1
      if counter%2 == 0
        sum = sum + everyTwo
        puts "everytwo: " + everyTwo.to_s
        everyTwo = 1
        counter = 0
        num = num+1
      end# inner if
    end #if else
    linecounter = linecounter+1;
  end #do end
  average = sum.to_f/num.to_f
  faverage = (fWidth*fHeight)/20
  puts average
  puts faverage
  return true if((average-faverage).abs < 1)
end #file

def angleConfirmation(fileName, angle1, angle2)
  File.open(fileName).each do |line|
    return false if line.to_i < angle1 || line.to_i > angle2
  end
  return true
end

def fileSize(filename)
  return File.size(filename)
end



puts findAverage("size.txt");
puts angleConfirmation("rotation.txt", -45, 45);
puts fileSize("/Users/Master/Downloads/downloadedCollage1.png")
