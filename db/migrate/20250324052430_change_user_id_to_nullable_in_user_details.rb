class ChangeUserIdToNullableInUserDetails < ActiveRecord::Migration[7.2]
  def change
    change_column_null :user_details, :user_id, true
  end
end
