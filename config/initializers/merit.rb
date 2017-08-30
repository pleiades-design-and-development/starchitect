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
badge_id = 0
[{
  id: (badge_id = badge_id+1),
  name: "new-cadet",
  description: "Joined the Starchitect Foundation!",
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
  }, {
  id: (badge_id = badge_id+1),
  name: "level-gain",
  description: "Climbed the ranks of the Starchitect Foundation.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "five-submits",
  description: "Submitted five total contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "ten-submits",
  description: "Submitted ten total contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "fifteen-submits",
  description: "Submitted 15 total contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "twenty-submits",
  description: "Submitted 20 total contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "five-create-submits",
  description: "Submitted five Creator contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "ten-create-submits",
  description: "Submitted ten Creator contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "fifteen-create-submits",
  description: "Submitted 15 Creator contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "twenty-create-submits",
  description: "Submitted 20 Creator contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "twenty-submits",
  description: "Submitted 20 total contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "five-create-submits",
  description: "Submitted five Creator contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "ten-create-submits",
  description: "Submitted ten Creator contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "fifteen-create-submits",
  description: "Submitted 15 Creator contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "twenty-create-submits",
  description: "Submitted 20 Creator contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "twenty-submits",
  description: "Submitted 20 total contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "five-create-submits",
  description: "Submitted five Creator contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "ten-create-submits",
  description: "Submitted ten Creator contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "fifteen-create-submits",
  description: "Submitted 15 Creator contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "twenty-create-submits",
  description: "Submitted 20 Creator contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "five-create-submits",
  description: "Submitted five Creator contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "ten-create-submits",
  description: "Submitted ten Creator contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "fifteen-create-submits",
  description: "Submitted 15 Creator contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "twenty-create-submits",
  description: "Submitted 20 Creator contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "five-explore-submits",
  description: "Submitted five Explorer contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "ten-explore-submits",
  description: "Submitted ten Explorer contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "fifteen-explore-submits",
  description: "Submitted 15 Explorer contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "twenty-explore-submits",
  description: "Submitted 20 Explorer contributions to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "first-comment",
  description: "Submitted their first comment to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "five-comments",
  description: "Submitted five comments to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "ten-comments",
  description: "Submitted ten comments to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "fifteen-comments",
  description: "Submitted 15 comments to the Starchives.",
  custom_fields: {  }
  }, {
  id: (badge_id = badge_id+1),
  name: "twenty-comments",
  description: "Submitted 20 comments to the Starchives.",
  custom_fields: {  }

  }].each do |attrs|
  Merit::Badge.create! attrs
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
