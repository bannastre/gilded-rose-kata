class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

      item.update_quality

      case item.quality
      when -Float::INFINITY..0
        item.quality = 0
      when 51..Float::INFINITY
        item.quality = 50
      end
    end
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality
    @sell_in > 0 ? @quality -= 1 : @quality -= 2
    @sell_in -= 1
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

class Sulfuras
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality
  end
end

class AgedBrie
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality
    @sell_in > 0 ? @quality += 1 : @quality += 2
    @sell_in -= 1
  end
end

class BackStagePass
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality
    case @sell_in
    when -Float::INFINITY..0
      @quality = 0
    when 1..5
      @quality += 3
    when 6..10
      @quality += 2
    when 11..Float::INFINITY
      @quality += 1
    end
    @sell_in -= 1
  end
end

class ConjouredItem
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality
    @sell_in > 0 ? @quality -= 2 : @quality -= 4
    @sell_in -= 1
  end
end
