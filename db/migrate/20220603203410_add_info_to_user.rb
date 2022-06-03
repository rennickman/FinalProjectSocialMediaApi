class AddInfoToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :status, :string
    add_column :users, :originalCity, :string
    add_column :users, :currentCity, :string
    add_column :users, :loves, :string
    add_column :users, :hates, :string
    add_column :users, :desc, :text
  end
end
