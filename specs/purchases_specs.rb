require('minitest/autorun')
require('minitest/rg')

require_relative('../models/purchases')

class PurchasesTest < MiniTest::Test

  def setup
    @purchase1 = Purchase.new('merchant_id' => 1, 'tag_id' => 2, 'amount' => 50.02)
    @purchase2 = Purchase.new('merchant_id' => 3, 'tag_id' => 4, 'amount' => 87.97)
  end

  def test_purchase_has_amount
    assert_equal(50.02, @purchase1.amount)
  end

  def test_purchase_has_merchant_id
    assert_equal(1, @purchase1.merchant_id)
  end

  def test_purchase_has_tag_id
    assert_equal(2, @purchase1.tag_id)
  end

  def test_purchase_has_id__false
    assert_nil(@purchase1.id)
  end

  def test_purchase_has_id__true
    @purchase1.save
    assert_equal(true, @purchase1.id > 0)
  end

  # def test_can_find_all_purchases
  #   Purchase.delete_all
  #   @purchase1.save
  #   @purchase2.save
  #   assert_equal([@purchase1, @purchase2], Purchase.find_all)
  # end
  #
  # def test_can_find_one_purchase_by_id
  #   Purchase.delete_all
  #   @purchase1.save
  #   assert_equal(@purchase1, Purchase.find_by_id(@purchase1.id))
  # end

  def test_can_delete_all_purchases
    #may need to drop tables and re-seed database to get this test working
    Purchase.delete_all
    assert_equal([], Purchase.find_all)
  end

  # def test_can_delete_one_purchase
  #   @purchase2.save
  #   Purchase.delete_by_id(@purchase2.id)
  #   assert_true(,)
  # end

  # def test_purchase_can_update
  #
  # end

end
