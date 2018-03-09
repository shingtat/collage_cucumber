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

def whiteBorderTest(fileDirectory)
  counter = 0
  for i in 1..30
    return false if borderCheck(fileDirectory + "border" + i.to_s + ".txt")==false
  end
  return true
end

def noWhiteSpace(fileName)
  content = IO.readlines(fileName)
  rows = content.length
  for i in 0..rows-1
    lineArr = content[i].split(" ")
    lineArr.each do |num|
      return false if num!="0"
    end
  end
  return true
end

puts noWhiteSpace("background.txt")
