class Triangle
	
	attr_reader :side_1, :side_2, :side_3
	
	def initialize(side_1, side_2, side_3)
		@side_1, @side_2, @side_3 = side_1, side_2, side_3
	end

	def kind
		eq, is, sc = :equilateral, :isosceles, :scalene

		#check for negative sides
		if (side_1 <= 0 || side_2 <= 0 || side_3 <= 0)
			begin
				raise TriangleError
			# rescue TriangleError => error
			# 	puts error.negative_side
			end

			#check for side inequality
		elsif ((side_1 + side_2 <= side_3) || (side_1 >= side_2 + side_3) || (side_1 + side_3 <= side_2 ))
			begin
				raise TriangleError
			# rescue TriangleError => error
			# 	puts error.inequality
			end
		end
		
		#if all sides equal
		if (side_1 == side_2 && side_2 == side_3)
			return eq
		#if all side !equal
		elsif (side_1 != side_2 && side_2 != side_3 && side_1 != side_3)
			return sc
		else 
		#else 2 sides equal
			return is
		end
	end

	class TriangleError < StandardError
		def inequality
			"this triangle violates the triangle inequality condition"
		end

		def negative_side
			"this triangle has a negative side"
		end

	end
end
