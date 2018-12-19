require('minitest/autorun')
require('minitest/rg')

require_relative('../models/users')

class UserTest < MiniTest::Test

  def setup
    @user1 = User.new('name' => 'Michael', 'budget' => 100.00)
    @user2 = User.new('name' => 'dan', 'budget' => 200.45)
  end

  def test_user_has_name
    assert_equal("Michael", @user1.name)
  end

  def test_user_has_budget
    assert_equal(100.00, @user1.budget)
  end

  def test_user_has_id__false
    assert_nil(@user1.id)
  end

  def test_can_find_all_users
    User.delete_all
    @user1.save
    @user2.save
    assert_equal(@user1.id, User.find_all[0].id)
    assert_equal(@user2.id, User.find_all[1].id)
  end

  def test_can_find_one_user_by_id
    User.delete_all
    @user1.save
    assert_equal(@user1.id, User.find_by_id(@user1.id).id)
  end

  def test_can_delete_all_users
    @user1.save
    @user2.save
    User.delete_all
    assert_equal([], User.find_all)
  end

  def test_can_delete_one_user
    User.delete_all
    @user2.save
    User.delete_by_id(@user2.id)
    assert_equal([], User.find_all)
  end

  def test_user_can_update
    User.delete_all
    @user1.name = 'Wint'
    @user1.save
    assert_equal('Wint', User.find_all[0].name)
  end

  def test_name_to_title_case
    assert_equal('Dan', @user2.name_to_title_case)
  end

end
