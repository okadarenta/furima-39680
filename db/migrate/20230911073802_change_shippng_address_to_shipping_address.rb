class ChangeShippngAddressToShippingAddress < ActiveRecord::Migration[6.0]
  def change
    rename_table :shippng_addresses, :shipping_addresses
  end
end