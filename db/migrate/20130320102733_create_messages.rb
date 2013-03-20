class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.text :message
      t.integer :user_id
      t.boolean :is_guest, :default => false
      t.string :guest_name
      t.string :guest_email

      t.timestamps
    end
  end
end
