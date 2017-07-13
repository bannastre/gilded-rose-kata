class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.update_quality

      item.quality > 50 ? item.quality = 50 : item.quality = item.quality
      item.quality < 0 ? item.quality = 0 : item.quality = item.quality
    end
  end

end

class NormalItem
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
    @sell_in < 11 ? @quality += 1 : @quality
    @sell_in < 6 ? @quality += 1 : @quality
    @sell_in > 0 ? @quality += 1 : @quality = 0
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
