class AddUserIdToNotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :notes, :user, null: false, foreign_key: true, default: ""
  end
end
