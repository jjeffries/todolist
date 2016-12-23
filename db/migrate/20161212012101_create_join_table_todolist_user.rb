class CreateJoinTableTodolistUser < ActiveRecord::Migration
  def change
    create_table :todoLists_users do |t|
      # t.index [:todo_list_id, :user_id]
      # t.index [:user_id, :todo_list_id]
      t.references :user, index: true, foreign_key: true
    end
  end
end
