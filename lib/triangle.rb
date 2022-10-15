class Triangle

  attr_accessor :l1, :l2, :l3

  def initialize(l1, l2, l3)
    @l1 = l1
    @l2 = l2
    @l3 = l3
  end

  def kind
    validate_triangle
    # if sides > 0 && l1 + l2 > l3 or l2 + l3 > l1 or l1 + l3 > l2
    if l1 == l2 && l2 == l3 && l1 == l3
      :equilateral
    elsif l1 == l2 || l2 == l3 || l1 == l3
      :isosceles
    elsif l1 != l2 && l2 != l3 && l1 != l3
      :scalene
    # elsif l1 <= 0 || l2 <= 0 || l3 <= 0 || l1 + l2 < l3 || l2 + l3 < l1 || l1 + l3 < l2
    #   begin
    #     raise TriangleError
    #   end
    end
  end

  def size_greater_than_zero?
    [l1, l2, l3].all?(&:positive?)
  end

  def all_sides_valid?
    l1 + l2 > l3 && l2 + l3 > l1 && l1 + l3 > l2
  end

  def validate_triangle
    raise TriangleError unless size_greater_than_zero? && all_sides_valid?
  end

  class TriangleError < StandardError
  end

end

