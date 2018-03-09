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

#FOR REQUIREMENT 5: Each photo has a 3 pixel white frame surrounding it
def borderCheck(fileName)
  content = IO.readlines(fileName)
  rows = content.length
  columns = content[0].length
  for i in 0..rows-1
    lineArr = content[i].split(" ")
    if i < 3 || i >= rows-3
      lineArr.each do |num|
        return false if num!="0"
      end

    else
      for i in 0..2
        return false if lineArr[i]!="0"
      end
    end
  end
  return true
end

#FOR REQUIREMENT 5: Each photo has a 3 pixel white frame surrounding it
def whiteBorderTest(fileDirectory)
  counter = 0
  for i in 1..30
    return false if borderCheck(fileDirectory + "border" + i.to_s + ".txt")==false
  end
  return true
end

#FOR REQUIREMENT 8: No white (empty) space should be present in the collage
def noWhiteSpace(fileName)
  content = IO.readlines(fileName)
  rows = content.length
  for i in 0..rows-1
    lineArr = content[i].split(" ")
    lineArr.each do |num|
      return false if num!="1"
    end
  end
  return true
end
