stock_prices_yesterday = [10, 7, 5, 8, 11, 9]
falling_stock_prices = [10, 9, 8, 7, 6, 5]

def get_max_profit(prices)
  if prices.min == prices[-1]
    "No profit to be had."
  else
    prices[prices.index(prices.min)..-1].max - prices.min
  end
end

p get_max_profit(stock_prices_yesterday)
# returns 6 (buying for $5 and selling for $11)
p get_max_profit(falling_stock_prices)
# returns "No profit to be had."
