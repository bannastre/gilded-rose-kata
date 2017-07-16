class Item {
  constructor(name, sellIn, quality){
    this.name = name;
    this.sellIn = sellIn;
    this.quality = quality;
  }
}

class Shop {
  constructor(items=[]){
    this.items = items;
  }
  updateQuality() {
    for (var i = 0; i < this.items.length; i++) {

      if (this.items[i].name === 'Sulfuras, Hand of Ragnaros') {
        // do nothing
      } else if (this.items[i].name === 'Aged Brie') {
        if (this.items[i].sellIn === 0) {
          this.items[i].quality += 2;
        } else if (this.items[i].sellIn >= 1) {
          this.items[i].quality += 1;
        }
        this.items[i].sellIn -= 1;

      } else if (this.items[i].name === 'Backstage passes to a TAFKAL80ETC concert') {
        if (this.items[i].sellIn === 0){
          this.items[i].quality = 0;
        } else if (this.items[i].sellIn > 10) {
          this.items[i].quality += 1;
        } else if (this.items[i].sellIn > 5) {
          this.items[i].quality += 2;
        } else if (this.items[i].sellIn > 0) {
          this.items[i].quality += 3;
        }
        this.items[i].sellIn -= 1;

      } else {
        if (this.items[i].sellIn === 0) {
          this.items[i].quality -= 2;
        } else if (this.items[i].sellIn >= 1) {
          this.items[i].quality -= 1;
        }
        this.items[i].sellIn -= 1;
      }

      // TODO: The following changes the performance of the method!!

      if (this.items[i].sellIn <= 0){
          this.items[i].sellIn = 0
      }

      if (this.items[i].quality <= 0){
          this.items[i].quality = 0
      }

      if (this.items[i].quality >= 50){
          this.items[i].quality = 50
      }

    }
    return this.items;
  }
}
