class CreateSpaces < ActiveRecord::Migration
  def change
    create_table(:spaces) do |t|
      t.column(:x_coordinate, :integer)
      t.column(:y_coordinate, :integer)

      t.timestamps
    end
  end
end
