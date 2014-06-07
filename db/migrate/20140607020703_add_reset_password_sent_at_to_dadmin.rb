class AddResetPasswordSentAtToDadmin < ActiveRecord::Migration
  def change
    add_column :dadmins, :reset_password_sent_at, :datetime
  end
end
