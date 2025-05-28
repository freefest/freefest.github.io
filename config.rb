activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :i18n, mount_at_root: :hu

Haml::TempleEngine.disable_option_validator!

set :relative_links, true

activate :deploy do |deploy|
  deploy.build_before = true
end

activate :directory_indexes
