class Sharad
	def initialize(number = rand(10)+1)
		@number = number
	end
	def guess(try)
		
		if try == @number
			puts "Wow, congrats. Your a lucky guy!"
		elsif try < @number
			puts "Nah, wrong guess. Number is bigger"
		elsif try > @number
			puts "Nah, wrong guess. Number is smaller"
		end
		
		print @number
	end
end


if __FILE__ == $0
	num = Sharad.new
	puts "Please guess number (it's between 1 and 10)"
	num.guess(gets().to_i)
	
end