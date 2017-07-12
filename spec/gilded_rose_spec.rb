require File.join(File.dirname(__FILE__), '../gilded_rose')

describe GildedRose do

  describe "#update_normal_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "reduces quality by 2 if sell_in == 0" do
      items = [Item.new("foo", 0, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 48
    end

    it "reduces quality by 1 if sell_in > 0" do
      items = [Item.new("foo", 1, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 49
    end

    it 'does not reduce quality below 0' do
      items = [Item.new("foo", 0, 1)]
      GildedRose.new(items).update_quality()
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "reduces sell_in by 1" do
      items = [Item.new("foo", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
    end
  end

  describe "#Aged Brie" do
    it "increase quality by 2 if sell_in == 0" do
      items = [Item.new("Aged Brie", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 2
    end

    it "increases quality by 1 if sell_in > 0" do
      items = [Item.new("Aged Brie", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 1
    end

    it 'caps quality at 50' do
      items = [Item.new("Aged Brie", 0, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end

    it "reduces sell_in by 1" do
      items = [Item.new("Aged Brie", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
    end
  end

  describe "#Backstage passes to a TAFKAL80ETC concert" do
    it "reduces quality to 0 if sell_in <= 0" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "increases quality by 3 if sell_in > 0" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 3
    end

    it "increases quality by 2 if sell_in > 5" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 2
    end

    it "increases quality by 1 if sell_in > 10" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 1
    end

    it 'caps quality at 50' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 2, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end

    it "reduces sell_in by 1" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
    end
  end

  describe "#Sulfuras, Hand of Ragnaros" do
    it "does not change quality if sell_in == 0" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "does not change quality if sell_in > 0" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "does not reduce sell_in" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 1
    end
  end

end
