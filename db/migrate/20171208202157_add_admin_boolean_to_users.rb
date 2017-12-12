class AddAdminBooleanToUsers < ActiveRecord::Migration
  def change
  	def up
  		change_column :users, :admin, :boolean, :default => false
  	end

  end
end
