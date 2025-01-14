require_dependency 'redmine_omniauth_saml'

Redmine::Plugin.register :redmine_omniauth_saml do
  name 'Redmine Omniauth SAML plugin'
  description 'This plugin adds Omniauth SAML support to Redmine.'
  author 'Christian A. Rodriguez, Alexander Meindl'
  url 'https://github.com/alexandermeindl/redmine_omniauth_saml'
  version '0.9.9'
  requires_redmine version_or_higher: '3.4'
  settings default: { 'enabled' => 'true', 'label_login_with_saml' => '', 'replace_redmine_login' => false },
           partial: 'settings/omniauth_saml/omniauth_saml'
end

if ActiveRecord::Base.connection.table_exists?(:settings)
  Rails.configuration.to_prepare do
    Redmine::OmniAuthSAML.setup
  end
end
