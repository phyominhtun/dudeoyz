class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
      t.string :email
      t.text :description

      t.timestamps null: false
    end
  end
end
