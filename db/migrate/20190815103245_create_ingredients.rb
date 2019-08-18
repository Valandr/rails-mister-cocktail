class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      # t.references :doses
      validates_presence_of :foreign_key

      t.timestamps
    end
  end
end
