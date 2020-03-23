# frozen_string_literal: true

# Execute with the command:
# bundle exec rake remove_never_active_users:clear

namespace :remove_never_active_users do
  desc 'clear never active users'
  task clear: :environment do
    constraints = 'sign_in_count = 0 AND created_at <= ?'
    users_unconfirmed = User.where(constraints, 24.hours.ago)
    users_unconfirmed.find_each(&:destroy)
  end
end
