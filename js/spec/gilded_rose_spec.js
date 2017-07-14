describe("Gilded Rose", function() {

  it("should foo", function(){
    var gilgedRose = new Shop([ new Item("foo", 0, 0) ]);
    var items = gilgedRose.updateQuality();
    expect(items[0].name).toEqual("foo");
  });

  it("caps quality at 50", function(){
    var gilgedRose = new Shop([ new Item("Aged Brie", 0, 50) ]);
    var items = gilgedRose.updateQuality();
    expect(items[0].quality).toEqual(50);
  });

  it("floors quality at 0", function(){
    var gilgedRose = new Shop([ new Item("foo", 0, 0) ]);
    var items = gilgedRose.updateQuality();
    expect(items[0].quality).toEqual(0);
  });

  describe("Normal Item", function(){

    it("reduces quality by 2 when you have a sellIn of <= 0", function(){
      var gilgedRose = new Shop([ new Item("foo", 0, 50) ]);
      var items = gilgedRose.updateQuality();
      expect(items[0].quality).toEqual(48);
    });

    it("reduces quality by 1 when you have a sellIn of >0", function(){
      var gilgedRose = new Shop([ new Item("foo", 1, 50) ]);
      var items = gilgedRose.updateQuality();
      expect(items[0].quality).toEqual(49);
    });

    it("reduces selIn by 1", function(){
      var gilgedRose = new Shop([ new Item("foo", 1, 0) ]);
      var items = gilgedRose.updateQuality();
      expect(items[0].sellIn).toEqual(0);
    });

  });

  describe("Sulfuras", function(){

    it("doesn't change quality", function(){
      var gilgedRose = new Shop([ new Item("Sulfuras, Hand of Ragnaros", 0, 50) ]);
      var items = gilgedRose.updateQuality();
      expect(items[0].quality).toEqual(50);
    });

    it("doesn't change sell_in", function(){
      var gilgedRose = new Shop([ new Item("Sulfuras, Hand of Ragnaros", 1, 50) ]);
      var items = gilgedRose.updateQuality();
      expect(items[0].quality).toEqual(50);
    });

  });

  describe("Aged Brie", function(){

    it("increases quality by 2 when you have a sellIn of <= 0", function(){
      var gilgedRose = new Shop([ new Item("Aged Brie", 0, 0) ]);
      var items = gilgedRose.updateQuality();
      expect(items[0].quality).toEqual(2);
    });

    it("increases quality by 1 when you have a sellIn of >0", function(){
      var gilgedRose = new Shop([ new Item("Aged Brie", 1, 0) ]);
      var items = gilgedRose.updateQuality();
      expect(items[0].quality).toEqual(1);
    });

  });

  describe("Backstage Passes", function(){

    it("increases quality to 0 when you have a sellIn of <= 0", function(){
      var gilgedRose = new Shop([ new Item("Backstage passes to a TAFKAL80ETC concert", 0, 50) ]);
      var items = gilgedRose.updateQuality();
      expect(items[0].quality).toEqual(0);
    });

    it("increases quality by 3 when you have a sellIn of >0", function(){
      var gilgedRose = new Shop([ new Item("Backstage passes to a TAFKAL80ETC concert", 1, 1) ]);
      var items = gilgedRose.updateQuality();
      expect(items[0].quality).toEqual(4);
    });

    it("increases quality by 2 when you have a sellIn of >5", function(){
      var gilgedRose = new Shop([ new Item("Backstage passes to a TAFKAL80ETC concert", 6, 1) ]);
      var items = gilgedRose.updateQuality();
      expect(items[0].quality).toEqual(3);
    });

    it("increases quality by 1 when you have a sellIn of >10", function(){
      var gilgedRose = new Shop([ new Item("Backstage passes to a TAFKAL80ETC concert", 11, 1) ]);
      var items = gilgedRose.updateQuality();
      expect(items[0].quality).toEqual(2);
    });

    it("reduces selIn by 1", function(){
      var gilgedRose = new Shop([ new Item("Backstage passes to a TAFKAL80ETC concert", 1, 0) ]);
      var items = gilgedRose.updateQuality();
      expect(items[0].sellIn).toEqual(0);
    });

  });
});
