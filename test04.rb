class Piramid
	def initialize(symbol)

		@sym = symbol.chomp
		puts
		puts

	end

	def draw(max)
		i = 1
		until i >= max.to_i
			j = 0
			until j >= i
				print @sym
				j+=1
			end
			puts
			i= i+2
		end
		i = i - 3
		while i >= 0
			i = i - 2
			j = i
			while j >= 0
				print @sym
				j-=1
			end
			puts
		end

	end
end

if __FILE__ == $0
	puts "please provide symbol - "
	p = Piramid.new(gets())
	p.draw(10)

end
