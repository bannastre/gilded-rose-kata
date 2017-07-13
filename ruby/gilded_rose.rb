class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

      case item.name
      when "Sulfuras, Hand of Ragnaros"
      when "Aged Brie"
        item.sell_in > 0 ? item.quality += 1 : item.quality += 2
        item.sell_in -= 1
      when "Backstage passes to a TAFKAL80ETC concert"
        item.sell_in < 11 ? item.quality += 1 : item.quality
        item.sell_in < 6 ? item.quality += 1 : item.quality
        item.sell_in > 0 ? item.quality += 1 : item.quality = 0
        item.sell_in -= 1
      else
        item.sell_in > 0 ? item.quality -= 1 : item.quality -= 2
        item.sell_in -= 1
      end

      item.quality > 50 ? item.quality = 50 : item.quality = item.quality
      item.quality < 0 ? item.quality = 0 : item.quality = item.quality
    end
  end
end #class

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
