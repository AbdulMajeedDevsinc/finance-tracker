class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks
  StockQuote::Stock.new(api_key: 'sk_65259f9fdd8345fd88fc37996d31bf0d')

  def self.new_form_lookup(ticker_symbol)
    looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
    new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol,
        last_price: looked_up_stock.previous_close)
  rescue Exception => e
    nil
  end

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
end
