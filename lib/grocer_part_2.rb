require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart

  new_hash = Hash.new(0)
  cart.each do |grocery_item|
    coupons.each do |coupon|
      new_hash = Hash.new(0)
      if grocery_item[:item] == coupon[:item]
        grocery_item[:count] -= coupon[:num]
        new_hash[:item] = grocery_item[:item] + " W/COUPON"
        new_hash[:price] = coupon[:cost] / coupon[:num]
        new_hash[:clearance] = grocery_item[:clearance]
        new_hash[:count] = coupon[:num]
        cart << new_hash
        break
      end
    end
  end
  cart
  
  
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
   cart.each do |grocery_item|
    if grocery_item[:clearance] == true
      grocery_item[:price] = (0.8 * grocery_item[:price]).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  
  apply_coupons_cart = apply_coupons(consolidate_cart(cart), coupons)
  apply_clearance_cart = apply_clearance(apply_coupons_cart)
  total = 0 
  apply_clearance_cart.each do |grocery_item|
    total += grocery_item[:price] * grocery_item[:count]
  end
  return total if total < 100
  return 0.9 * total if total >= 100
  
end
