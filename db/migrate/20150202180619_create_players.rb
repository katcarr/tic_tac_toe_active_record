class CreatePlayers < ActiveRecord::Migration
  def change
    create_table(:players) do |t|

      t.column(:mark, :string)

      t.timestamps
    end
  end
end
