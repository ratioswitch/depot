class AddHighlightToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :highlight, :string
  end

  def self.down
    remove_column :products, :highlight
  end
end
