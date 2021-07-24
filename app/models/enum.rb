class Enum

  include Enumerable

  def initialize(order)
    @order = order
    @product_lines = @order.product_lines
  end

  def each
    puts "0"
    @product_lines.flat_map(&:trackings).each do |tracking|
      puts "1"
      yield tracking
      puts "2"
    end
  end

  def <=>(other)
    self.stage_id > other.stage_id 
  end
end
