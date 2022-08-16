class CreateCoffee < ActiveRecord::Migration[5.2]
  def change
    create_table :coffee do |t|
      t.string :title
    end
  end
end
