class CreateStripeInvoiceInvoices < ActiveRecord::Migration
  def change
    create_table :stripe_invoice_invoices do |t|
      t.integer :owner_id
      t.string  :stripe_id
      t.string  :invoice_number
      t.integer :date
      t.text    :json

      t.timestamps
    end
  end
end
