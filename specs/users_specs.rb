require('minitest/autorun')
require('minitest/rg')

require_relative('../models/users')

class UsersTest < MiniTest::Test

  def setup
    @user1 = User.new('name' => 'Michael', 'budget' => 100.00)
    @user2 = User.new('name' => 'Ian', 'budget' => 200.45)
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

  def test_merchant_has_id__true
    @user1.save
    assert_equal(true, @user1.id > 0)
  end

  # def test_can_find_all_merchants
  #   Merchant.delete_all
  #   @merchant1.save
  #   @merchant2.save
  #   assert_equal([@merchant1, @merchant2], Merchant.find_all)
  # end
  #
  # def test_can_find_one_merchant_by_id
  #   Merchant.delete_all
  #   @merchant1.save
  #   assert_equal(@merchant1, Merchant.find_by_id(@merchant1.id))
  # end

  def test_can_delete_all_users
    @user2.save
    User.delete_all
    assert_equal([], User.find_all)
  end

  # def test_can_delete_one_merchant
  #   @merchant2.save
  #   Merchant.delete_by_id(@merchant2.id)
  #   assert_true(,)
  # end

  # def test_merchant_can_update
  #
  # end

  # def test_find_tags
  #
  # end

end
