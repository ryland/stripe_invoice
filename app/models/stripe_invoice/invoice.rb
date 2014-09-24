module StripeInvoice
  class Invoice < ActiveRecord::Base
    alias_attribute :number, :invoice_number

    serialize :json, JSON
    
    
    def indifferent_json
     @json ||= json.with_indifferent_access 
    end
    
    
    def subtotal
      indifferent_json[:subtotal]
    end
    
    def discount
      indifferent_json[:disocunt]
    end
    
    def total
      indifferent_json[:total]
    end
    
    def period_start
      indifferent_json[:period_start]
    end
    
    def period_end
      indifferent_json[:period_end]
    end
    
    def currency
      indifferent_json[:currency]
    end
    
    def lines
      indifferent_json[:lines]
    end
  end
end
