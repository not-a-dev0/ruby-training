class Matrix
  attr_accessor :arr

	def initialize(x, y)
		@arr = Array.new()
    @arr_min = 10000
    @arr_max = 0
  	#fill matrix with random values
		i = 0
		until i >= x
			j = 0
      @arr[i] = Array.new()
			until j >=y

        @arr[i][j] = rand(98)+1
        j+=1

      end
      i+=1
		end
    #puts @arr
	end
	
  def printOut(tmp = @arr)
    y = 0
    until y >= tmp.count
      x = 0
      until x >= tmp[0].count
        print tmp[y][x].to_s + ' '
        x += 1
      end
      puts
      y +=1
    end
  end

  def printMax()
    findMax()
    puts 'max value ' + @arr_max.to_s
  end

  def findMax()
    i = 0
    until i>= @arr.count
      if @arr_max < arr[i].max then
        @arr_max = arr[i].max
      end
      i +=1
    end
  end

  def findMin()
    i = 0
    until i>= @arr.count
      if @arr_min > arr[i].min then
        @arr_min = arr[i].min
      end
      i +=1
    end
  end

  def printMin()
    findMin()
    puts 'min value ' + @arr_min.to_s    
  end

  def SumWithoutBorder()
    #remove minimum and maximum values from array
    tmp = @arr
    i=0
    until i>= tmp.count
      tmp[i].delete(@arr_min)

      tmp[i].delete(@arr_max)
      i +=1
    end
        
    return tmp.inject(:+).inject(:+)

  end
end

if __FILE__ == $0
	mat = Matrix.new(10, 10)
  mat.printOut()

  puts
  mat.printMax()

  puts
  mat.printMin()

  puts mat.SumWithoutBorder()


end