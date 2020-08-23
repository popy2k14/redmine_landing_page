class AddLandingPageToProjects < ActiveRecord::Migration[4.2]

  def up
    unless column_exists?(:projects, :landing_page, :string)
      add_column :projects, :landing_page, :string
    end
  end
  
  def down
    if column_exists?(:projects, :landing_page, :string)
      remove_column :projects, :landing_page
    end
  end
  
end
