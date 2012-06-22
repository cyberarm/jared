require 'stock_quote'

class Helpers
  def self.stock(symbol='', mode='last')
    stock = StockQuote::Stock.quote("#{symbol}")
    if mode == 'last'
      puts "#{stock.last}"
    elsif mode == 'open'
      puts "#{stock.open}"
    elsif mode == 'close'
      puts "#{stock.close}"
    elsif mode == 'high'
      puts "#{stock.high}"
    elsif mode == 'low'
      puts "#{stock.low}"
    else
      puts "Mode: #{mode} not understood. try again."
    end
  end
end
