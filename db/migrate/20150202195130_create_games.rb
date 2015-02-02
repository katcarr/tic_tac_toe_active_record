class CreateGames < ActiveRecord::Migration
  def change
    create_table(:games) do |t|

      t.column(:board_id, :integer)

      t.timestamps
    end

      add_column(:players, :game_id, :integer)
  end
end
