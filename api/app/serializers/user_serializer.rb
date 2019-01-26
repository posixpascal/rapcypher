class UserSerializer < Blueprinter::Base
  identifier :id

  field :rapper_name
  field :favorite_punchline
  field :avatar do |user, options|
    Rails.application.routes.url_helpers.rails_blob_path user.avatar, only_path: true
  end



end
