class Stock < ApplicationRecord

    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(  publishable_token: 'Tpk_3897bde62f0a4adfb2564a1a5cbe6b2e',

                                            endpoint: 'https://sandbox.iexapis.com/v1')
        begin
            new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))    
        rescue => exception
            return nil
        end
    end
end
