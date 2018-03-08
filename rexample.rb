def findAverage(fileName)
  sum = 0;
  counter = 0;
  File.open(fileName).each do |line|
    puts line
    sum = sum + line.to_i;
    counter = counter+1;
  end
  return "sum: " +  (sum/counter).to_s;
end

def angleConfirmation(fileName)
  File.open(fileName).each do |line|
    return false if line.to_i < 0 || line.to_i > 45
  end
  return true
end

puts findAverage("example.txt");
puts angleConfirmation("example.txt");
