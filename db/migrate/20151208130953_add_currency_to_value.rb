class AddCurrencyToValue < ActiveRecord::Migration
  def change
    add_reference :values, :currency, index: true
  end
end
