class Stock < ApplicationRecord
  StockQuote::Stock.new(api_key: 'sk_65259f9fdd8345fd88fc37996d31bf0d')

  def self.new_form_lookup(ticker_symbol)
    begin
      looked_up_stock = StockQuote::Stock.quote( ticker_symbol)
      new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.previous_close)
    rescue Exception => e
      return nil
    end
  end
end
