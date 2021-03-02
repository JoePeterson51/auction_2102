class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    item_names = []
    items.each do |item|
      item_names << item.name
    end
    item_names
  end

  def unpopular_items
    unpopular_items = []
    @items.each do |item|
      if item.bids == {}
        unpopular_items << item
      end
    end
    unpopular_items
  end

  def potential_revenue
    @items.sum do |item|
      item.bids.sum do |bid|
        bid[1]
      end
    end
  end
end
