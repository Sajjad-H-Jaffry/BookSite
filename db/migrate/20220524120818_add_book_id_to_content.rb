class AddBookIdToContent < ActiveRecord::Migration[6.0]
  def change
    add_column :contents, :book_id, :integer
  end
end
