class AddComputerGamesAgain < ActiveRecord::Migration
  def change
    create_table(:computer_games) do |t|

      t.timestamps
    end
  end
end
