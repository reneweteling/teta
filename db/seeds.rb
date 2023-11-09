# Alchemy::Site.create!([
#                         { host: 'www.thecladekker.nl', name: 'thecladekker', public: true,
#                           aliases: "thecladekker.nl\r\nthecladekker.local.gd", redirect_to_primary_host: false },
#                         { host: 'www.energetischreinigen.com', name: 'energetischreinigen', public: true,
#                           aliases: "energetischreinigen.com\r\nenergetischreinigen.local.gd", redirect_to_primary_host: false }
#                       ])
# Alchemy::Language.create!([
#                             { name: 'Dutch', language_code: 'nl', frontpage_name: 'Index', page_layout: 'index', public: true, creator_id: nil,
#                               updater_id: nil, default: true, country_code: 'nl', site_id: 1, locale: 'nl' },
#                             { name: 'Dutch', language_code: 'nl', frontpage_name: 'Index', page_layout: 'index', public: true, creator_id: nil,
#                               updater_id: nil, default: true, country_code: 'nl', site_id: 2, locale: 'nl' }
#                           ])
# Alchemy::User.create!([
#                         { firstname: 'Rene', lastname: 'Weteling', login: 'reneweteling', password: 'Test123',
#                           password_confirmation: 'Test123', email: 'rene@weteling.com', language: 'nl', alchemy_roles: 'admin', tag_names: nil },
#                         { firstname: 'Thecla', lastname: 'Dekker', login: 'thecladekker', password: 'Test123',
#                           password_confirmation: 'Test123', email: 'thecladekker@gmail.com', language: 'nl', alchemy_roles: 'admin', tag_names: nil }
#                       ])
# Alchemy::Page.create!([
#                         { name: 'Index', urlname: 'index', title: 'Index', language_code: 'nl-nl', language_root: true, page_layout: 'index',
#                           meta_keywords: nil, meta_description: nil, parent_id: nil, creator_id: 1, updater_id: 1, language_id: 1, searchable: true, tag_names: nil },
#                         { name: 'Index', urlname: 'index', title: 'Index', language_code: 'nl-nl', language_root: true, page_layout: 'index',
#                           meta_keywords: nil, meta_description: nil, parent_id: nil, creator_id: 1, updater_id: 1, language_id: 2, searchable: true, tag_names: nil }
#                       ])

# Alchemy::Element.create!([
#                            { name: 'article', position: 1, public: true, folded: false, unique: true, creator_id: 1, updater_id: 1,
#                              parent_element_id: nil, fixed: false, page_version_id: 3, tag_names: nil },
#                            { name: 'article', position: 1, public: true, folded: false, unique: true, creator_id: nil, updater_id: nil,
#                              parent_element_id: nil, fixed: false, page_version_id: 4, tag_names: nil },
#                            { name: 'article', position: 1, public: true, folded: false, unique: true, creator_id: 1, updater_id: 1,
#                              parent_element_id: nil, fixed: false, page_version_id: 1, tag_names: nil },
#                            { name: 'article', position: 1, public: true, folded: false, unique: true, creator_id: nil, updater_id: nil,
#                              parent_element_id: nil, fixed: false, page_version_id: 2, tag_names: nil }
#                          ])

# bin/rails db:seed:dump APPEND=true MODELS=Alchemy::Language
# bin/rails db:seed:dump APPEND=true MODELS=Alchemy::User
# bin/rails db:seed:dump APPEND=true MODELS=Alchemy::Site
# bin/rails db:seed:dump APPEND=true MODELS=Alchemy::Page
# bin/rails db:seed:dump APPEND=true MODELS=Alchemy::Element
