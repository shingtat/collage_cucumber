def findAverage(fileName)
  sum = 0;
  counter = 0;
  everyTwo = 1;
  num = 0;
  File.open(fileName).each do |line|
    everyTwo = everyTwo * line.to_i;
    counter = counter+1
    if counter%2 == 0
      sum = sum + everyTwo
      puts "everytwo: " + everyTwo.to_s
      everyTwo = 1
      counter = 0
      num = num+1
    end
  end
  return sum/num;
end

def angleConfirmation(fileName)
  File.open(fileName).each do |line|
    return false if line.to_i < -45 || line.to_i > 45
  end
  return true
end

def fileSize(filename)
  return File.size(filename)
end
