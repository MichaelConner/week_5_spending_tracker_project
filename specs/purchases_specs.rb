require('minitest/autorun')
require('minitest/rg')

require_relative('../models/merchants')
require_relative('../models/purchases')
require_relative('../models/tags')

class PurchasesTest < MiniTest::Test

  def setup
    @merchant1 = Merchant.new('name' => 'amazon')
    @merchant1.save
    @merchant2 = Merchant.new('name' => 'Lothian Bus')
    @merchant2.save
    @merchant3 = Merchant.new('name' => 'bank of scotland')
    @merchant3.save

    @tag1 = Tag.new('type' => 'food')
    @tag1.save

    @purchase1 = Purchase.new('merchant_id' => @merchant1.id, 'tag_id' => @tag1.id, 'amount' => 50.02, 'purchase_date' => 20180901)
    @purchase2 = Purchase.new('merchant_id' => @merchant1.id, 'tag_id' => @tag1.id, 'amount' => 87.97, 'purchase_date' => 20180901)
  end

  def test_purchase_has_amount
    assert_equal('50.02', @purchase1.amount)
  end

  def test_purchase_has_merchant_id
    assert_equal(@merchant1.id, @purchase1.merchant_id)
  end

  def test_purchase_has_tag_id
    assert_equal(@tag1.id, @purchase1.tag_id)
  end

  def test_purchase_has_purchase_date
    assert_equal(20180901, @purchase1.purchase_date)
  end

  def test_purchase_has_id__false
    assert_nil(@purchase1.id)
  end

  def test_purchase_has_id__true
    @purchase1.save
    assert_equal(true, @purchase1.id > 0)
  end

  def test_can_find_all_purchasess
    Purchase.delete_all
    @purchase1.save
    @purchase2.save
    assert_equal(@purchase1.id, Purchase.find_all[0].id)
    assert_equal(@purchase2.id, Purchase.find_all[1].id)
  end

  def test_can_find_one_purchase_by_id
    Purchase.delete_all
    @purchase1.save
    assert_equal(@purchase1.id, Purchase.find_by_id(@purchase1.id).id)
  end

  def test_can_delete_all_purchases
    @purchase1.save
    @purchase2.save
    Purchase.delete_all
    assert_equal([], Purchase.find_all)
  end

  def test_can_delete_one_purchase
    Purchase.delete_all
    @purchase2.save
    Purchase.delete_by_id(@purchase2.id)
    assert_equal([], Purchase.find_all)
  end

  def test_purchase_can_update
    Purchase.delete_all
    @purchase1.amount = 100.22
    @purchase1.save
    assert_equal('100.22', Purchase.find_all[0].amount)
  end



end
