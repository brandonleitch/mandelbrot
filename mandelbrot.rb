class ComplexNumber

  attr_reader :real, :imag

  def initialize(a=0.0, b=0.0)
    @real = a
    @imag = b
  end

  def square
    ComplexNumber.new(@real ** 2 - @imag ** 2, 2 * @real * @imag)
  end

  def add(z)
    ComplexNumber.new(@real + z.real, @imag + z.imag)
  end

  def magnitude
    @real ** 2 + @imag ** 2
  end

  def in_mandelbrot_set?
    z = ComplexNumber.new
    500.times do
      z = z.square.add(self)
      if z.magnitude > 4 then return false end
    end
    true
  end

end


def main
  n, m = gets.chomp.split(" ").map { |e| e.to_f }
  m.to_i.times do |i|
    n.to_i.times do |j|
      c = ComplexNumber.new(j/n * 3.5 - 2.5, (i/m - 0.5) * 2)
      print c.in_mandelbrot_set? ? "*" : " "
    end
    puts
  end
end

main
