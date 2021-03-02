require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/attendee'
require './lib/auction'
class ItemTest < Minitest::Test

  def test_it_exists
    item1 = Item.new('Chalkware Piggy Bank')

    assert_instance_of Item, item1
  end

  def test_it_has_attributes
    item1 = Item.new('Chalkware Piggy Bank')


    assert_equal "Chalkware Piggy Bank", item1.name
    assert_equal ({}), item1.bids
  end

  def test_it_can_add_bids
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    attendee3 = Attendee.new(name: 'Mike', budget: '$100')
    auction = Auction.new

    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    assert_equal ({attendee2 => 20, attendee1 => 22}), item1.bids
  end

  def test_it_can_see_highest_bid
    item1 = Item.new('Chalkware Piggy Bank')
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    auction = Auction.new

    auction.add_item(item1)

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    assert_equal 22, item1.current_high_bid
  end


end
