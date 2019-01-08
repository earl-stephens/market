require 'pry'
class Market
  attr_reader :name,
              :vendors,
              :total_inventory

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    vendor_item_array = []
    @vendors.each do |vendor|
      if vendor.inventory.include?(item)
        vendor_item_array << vendor
      end
    end
    vendor_item_array
  end

  def sorted_item_list
    unsorted_item_list = []
    @vendors.each do |vendor|
      unsorted_item_list << vendor.inventory.keys
    end
    sorted_item_list = unsorted_item_list.flatten.uniq
    sorted_item_list.sort
  end

  def total_inventory
    @total_inventory = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        @total_inventory[item] += quantity
      end
    end
    @total_inventory
  end

  def sell(item, quantity)
    # binding.pry
    if quantity > @total_inventory[item]
      return false
    else
      # sell_item(item,quantity)
      return true
    end
  end

end
