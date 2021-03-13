class Triangle
  attr_accessor :side_1, :side_2, :side_3, :all_sides

  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
    @all_sides = [@side_1, @side_2, @side_3].sort
  end

  def kind 
    if real_triangle
      begin
        raise TriangleError
      end
    end

    if side_1 == side_2 && side_2 == side_3
      return :equilateral
    elsif side_1 == side_2 || side_1 == side_3 || side_2 == side_3
      :isosceles
    else
      :scalene
    end
  end

  def real_triangle
    all_sides.any? do |side|
      side < 0 || all_sides[0] + all_sides[1] <= all_sides[2]
    end
  end


  class TriangleError < StandardError
  end
end