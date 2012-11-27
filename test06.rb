# To change this template, choose Tools | Templates
# and open the template in the editor.
@cnt = 0
@prm = Array.new

def primeSearch(num)
  prime = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
  prime.each {|i| if i == num then
    @prm[@cnt] = num
    @cnt +=1
  end}
end

def randomize()
  return rand(49)+1
end

arr = Array.new()
i = 0
until i >= 10
  arr[i] = randomize()
  primeSearch(arr[i])
  i+=1
end


puts 'generated numbers are ' + arr.map {|i| "#{i}"}.join(", ")
puts 'total number of primes - ' + @cnt.to_s
puts 'these numbers are ' + @prm.map {|i| "#{i}"}.join(", ")

