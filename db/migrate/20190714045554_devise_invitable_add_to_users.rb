class DeviseInvitableAddToUsers < ActiveRecord::Migration[6.0]
  def up
    change_table :users do |t|
      t.string     :invitation_token
      t.datetime   :invitation_created_at
      t.datetime   :invitation_sent_at
      t.datetime   :invitation_accepted_at
      t.integer    :invitation_limit
      t.references :invited_by, polymorphic: true
      t.integer    :invitations_count, default: 0
      t.index      :invitations_count
      t.index      :invitation_token, unique: true # for invitable
      t.index      :invited_by_id
      t.string     :confirmation_token
      t.datetime   :confirmed_at
      t.datetime   :confirmation_sent_at
      t.string     :unconfirmed_email # Only if using reconfirmable
      
    end
    add_index  :users, :confirmation_token, :unique => true 
  end

  def down
    change_table :users do |t|
      t.remove_references :invited_by, polymorphic: true
      t.remove :invitations_count, :invitation_limit, :invitation_sent_at, :invitation_accepted_at, :invitation_token, :invitation_created_at,
      :confirmation_token, :confirmed_at, :confirmation_sent_at ,:unconfirmed_email
    end
  end
end
