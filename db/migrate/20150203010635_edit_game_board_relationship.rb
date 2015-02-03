class EditGameBoardRelationship < ActiveRecord::Migration
  def change

    add_column(:boards, :game_id, :integer)

  end
end
