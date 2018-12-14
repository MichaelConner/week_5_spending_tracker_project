require('minitest/autorun')
require('minitest/rg')


require_relative('../models/merchants')

class MerchantsTest < MiniTest::Test

  def setup
    @merchant1 = Merchant.new('name' => 'amazon')
    @merchant2 = Merchant.new('name' => 'Lothian Bus')
  end

  def test_merchant_has_name
    assert_equal("amazon", @merchant1.name)
  end

  def test_merchant_has_id__false
    assert_nil(@merchant1.id)
  end

  def test_merchant_has_id__true
    @merchant1.save
    assert_equal(true, @merchant1.id > 0)
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

  def test_can_delete_all_merchants
    @merchant2.save
    Merchant.delete_all
    assert_equal([], Merchant.find_all)
  end

  # def test_can_delete_one_merchant
  #   @merchant2.save
  #   Merchant.delete_by_id(@merchant2.id)
  #   assert_true(,)
  # end

  # def test_merchant_can_update
  #
  # end








end
