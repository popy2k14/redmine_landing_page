class AddLandingPageToUsers < ActiveRecord::Migration[4.2]

  def up
    unless column_exists?(:users, :landing_page, :string)
      add_column :users, :landing_page, :string
    end
  end

  def down
    if column_exists?(:users, :landing_page, :string)
      remove_column :users, :landing_page
    end
  end

end
