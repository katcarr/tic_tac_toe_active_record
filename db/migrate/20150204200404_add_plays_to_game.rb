class AddPlaysToGame < ActiveRecord::Migration
  def change
    add_column(:games, :plays, :integer)
  end
end
