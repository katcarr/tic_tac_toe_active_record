class CreateBoards < ActiveRecord::Migration
  def change
    create_table(:boards) do |t|

      t.timestamps
    end

    add_column(:spaces, :board_id, :integer)

  end
end
