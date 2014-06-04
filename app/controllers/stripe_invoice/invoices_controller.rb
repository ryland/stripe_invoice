require_dependency "stripe_invoice/application_controller"

module StripeInvoice
  class InvoicesController < ApplicationController
    
    def index
      # binding.pry
      owner = send("current_#{::Koudoku.subscriptions_owned_by.to_s}")
      redirect_to '/' unless owner
      
      @subscription = owner.subscription

      # I know this looks silly, but Koudoku actually stores the customer's stripe_id 
      # in the subscription model
      @invoices = Stripe::Invoice.all(
        :customer => @subscription.stripe_id,
        :limit => 100)
    end
  end
end