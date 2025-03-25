class DropAdminsTable < ActiveRecord::Migration[7.2]
  def up
    drop_table :admins
  end

  def down
    create_table :admins do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "email"
      t.string "password_digest"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    end
  end
end
