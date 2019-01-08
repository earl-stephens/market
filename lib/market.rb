class Market
  attr_reader :name,
              :vendors

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

end
