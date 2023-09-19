# frozen_string_literal: true

class CreateComents < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.references :post, foreign_key: { to_table: :posts }
      t.text :text
      t.timestamps
    end
  end
end
