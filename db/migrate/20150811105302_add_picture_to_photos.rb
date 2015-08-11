class AddPictureToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :picuture, :string
  end
end
