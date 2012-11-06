require 'stock_quote'

class Action
  class Stock
    def initialize(a,b='last')
      stock(a,b)
    end
    def stock(symbol='', mode='last')
      stock = StockQuote::Stock.quote("#{symbol}")
      puts "Stock data for: #{if stock.company.length == 0; raise "Invalid Stock. No stock data found for '#{symbol}'.";exit;else;stock.company;end}"
      if mode == 'last'
        puts "#{stock.last}"
      elsif mode == 'open'
        puts "#{stock.open}"
      elsif mode == 'close'
        puts "#{stock.y_close}"
      elsif mode == 'high'
        puts "#{stock.high}"
      elsif mode == 'low'
        puts "#{stock.low}"
      else
        puts "Mode: '#{mode}' not understood. try again."
      end
    end
  end
end

if ARGV[1].length <= 0
  puts "Symbol not defined."
  Kernel.exit
end

Action::Stock.new(ARGV[1]) unless defined?(ARGV[2].length)
Action::Stock.new(ARGV[1], ARGV[2]) if defined?(ARGV[2].length)
