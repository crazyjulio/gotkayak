class DeviseCreateDadmins < ActiveRecord::Migration
  def self.up
    create_table(:dadmins) do |t|
      t.database_authenticatable :null => false
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :dadmins, :email,                :unique => true
    #add_index :dadmins, :reset_password_token, :unique => true
    # add_index :dadmins, :confirmation_token,   :unique => true
    # add_index :dadmins, :unlock_token,         :unique => true
    # add_index :dadmins, :authentication_token, :unique => true
  end

  def self.down
    drop_table :dadmins
  end
end
