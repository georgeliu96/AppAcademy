class UniqueBandAlbumTitle < ActiveRecord::Migration[5.2]
  def change
    add_index :albums, [:title, :band_id], unique: true
  end
end
