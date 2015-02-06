class RefactorComputerGameRelationship < ActiveRecord::Migration
  def change

    add_column(:games, :type, :string)

  end
end
