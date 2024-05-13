require 'redmine'
#hooks
require File.expand_path('../lib/redmine_landing_page/hooks/view_projects_form_hook', __FILE__)
require File.expand_path('../lib/redmine_landing_page/hooks/view_my_account_hook', __FILE__)
require File.expand_path('../lib/redmine_landing_page/hooks/view_users_form_hook', __FILE__)

Redmine::Plugin.register :redmine_landing_page do
  name 'Redmine Landing Page plugin'
  author 'Igor Zubkov'
  description 'Redmine Landing Page plugin'
  version '0.1.2'
  url 'https://github.com/biow0lf/redmine_landing_page'
  author_url 'https://github.com/biow0lf'

  requires_redmine '2.2.0'
end

# Patches to the Redmine core.
patched_classes = %w(projects_controller project user welcome_controller)
patched_classes.each do |core_class|
   require core_class
   "RedmineLandingPage::#{core_class.camelize}Patch".constantize.perform
end
