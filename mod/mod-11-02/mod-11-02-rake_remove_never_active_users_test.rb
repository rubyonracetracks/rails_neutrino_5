require 'test_helper'
require 'rake'

class RakeRemoveUnconfirmedUsersTest < ActiveSupport::TestCase
  # rubocop:disable Metrics/MethodLength
  def setup
    @user101 = User.create(name: 'User #101',
                           username: 'user101',
                           email: 'u101@example.com',
                           password: 'Daytona 500',
                           password_confirmation: 'Daytona 500',
                           created_at: 25.hours.ago,
                           sign_in_count: 1)
    @user102 = User.create(name: 'User #102',
                           username: 'user102',
                           email: 'u102@example.com',
                           password: 'Daytona 500',
                           password_confirmation: 'Daytona 500',
                           created_at: Time.now,
                           sign_in_count: 0)
    @user103 = User.create(name: 'User #103',
                           username: 'user103',
                           email: 'u103@example.com',
                           password: 'Daytona 500',
                           password_confirmation: 'Daytona 500',
                           created_at: 23.hours.ago,
                           sign_in_count: 0)
    @user104 = User.create(name: 'User #104',
                           username: 'user104',
                           email: 'u104@example.com',
                           password: 'Daytona 500',
                           password_confirmation: 'Daytona 500',
                           created_at: 25.hours.ago,
                           sign_in_count: 0)
  end
  # rubocop:enable Metrics/MethodLength

  test 'should remove never active users' do
    assert_not_nil User.find_by(email: 'u104@example.com')
    assert_difference 'User.count', -1 do
      Rake::Task['remove_never_active_users:clear'].invoke
    end
    assert_nil User.find_by(email: 'u104@example.com')
  end
end
