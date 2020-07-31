class AddPasswordDigestToPlanners < ActiveRecord::Migration[6.0]
  def change
    add_column :planners, :password_digest, :string
  end
end
