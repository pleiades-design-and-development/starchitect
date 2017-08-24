# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end

badge_id = 0
[{
  id: (badge_id = badge_id+1),
  name: "new-cadet",
  description: "Joined the Starchitects!",
  custom_fields: {  }
}, {
  id: (badge_id = badge_id+1),
  name: "first-submit",
  description: "Submitted their first contribution the the Starchives.",
  custom_fields: {  }
}, {
  id: (badge_id = badge_id+1),
  name: "first-explore-submit",
  description: "Submitted their first Explorer Mode contribution to the Starchives.",
  custom_fields: {  }
}, {
  id: (badge_id = badge_id+1),
  name: "first-create-submit",
  description: "Submitted their first Creator Mode contribution to the Starchives.",
  custom_fields: {  }
}, {
  id: (badge_id = badge_id+1),
  name: "profile-complete",
  description: "Completed their Starchitect profile.",
  custom_fields: {  }
}, {
  id: (badge_id = badge_id+1),
  name: "first-media-upload",
  description: "Submitted their first contribution with a media upload to the Starchives.",
  custom_fields: {  }
}].each do |attrs|
  Merit::Badge.create! attrs
end


# Merit::Badge.create!(
#   id: 1,
#   name: "new-cadet",
#   description: "Joined the Starchitects!",
#   custom_fields: {  }
# )
#
# Merit::Badge.create!(
#   id: 2,
#   name: "first-submit",
#   description: "Submitted their first contribution the the Starchives.",
#   custom_fields: {  }
# )
#
# Merit::Badge.create!(
#   id: 3,
#   name: "first-explore-submit",
#   description: "Submitted their first Explorer Mode contribution to the Starchives.",
#   custom_fields: {  }
# )
#
# Merit::Badge.create!(
#   id: 4,
#   name: "first-create-submit",
#   description: "Submitted their first Creator Mode contribution to the Starchives.",
#   custom_fields: {  }
# )
#
# Merit::Badge.create!(
#   id: 5,
#   name: "profile-complete",
#   description: "Completed their Starchitect profile.",
#   custom_fields: {  }
# )
#
# Merit::Badge.create!(
#   id: 6,
#   name: "first-media-upload",
#   description: "Submitted their first contribution with a media upload to the Starchives.",
#   custom_fields: {  }
# )
