class AddPeopleInHouseholdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :people_in_household, :integer, default: 1
    User.all.each do |user|
      user.update_attribute(:people_in_household, 1)
    end
  end
end
