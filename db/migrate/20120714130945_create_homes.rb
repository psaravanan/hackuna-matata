class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.text :content

      t.timestamps
    end
  end
end
