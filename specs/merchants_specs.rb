require('minitest/autorun')
require('minitest/rg')

require_relative('../models/merchants')
require_relative('../models/purchases')
require_relative('../models/tags')

class MerchantsTest < MiniTest::Test

  def setup
    @merchant1 = Merchant.new('name' => 'amazon')
    @merchant2 = Merchant.new('name' => 'Lothian Bus')
    @merchant3 = Merchant.new('name' => 'bank of scotland')

    @tag1 = Tag.new('type' => 'food')

    @purchase1 = Purchase.new('merchant_id' => 131, 'tag_id' => 19, 'amount' => 50.02, 'purchase_date' => 20180901)
    @purchase2 = Purchase.new('merchant_id' => 131, 'tag_id' => 19, 'amount' => 87.97, 'purchase_date' => 20180901)
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

  def test_can_find_all_merchants
    Merchant.delete_all
    @merchant1.save
    @merchant2.save
    assert_equal(@merchant1.id, Merchant.find_all[0].id)
    assert_equal(@merchant2.id, Merchant.find_all[1].id)
  end

  def test_can_find_one_merchant_by_id
    Merchant.delete_all
    @merchant1.save
    assert_equal(@merchant1.id, Merchant.find_by_id(@merchant1.id).id)
  end

  def test_can_delete_all_merchants
    @merchant1.save
    @merchant2.save
    Merchant.delete_all
    assert_equal([], Merchant.find_all)
  end

  def test_can_delete_one_merchant
    Merchant.delete_all
    @merchant2.save
    Merchant.delete_by_id(@merchant2.id)
    assert_equal([], Merchant.find_all)
  end

  def test_merchant_can_update
    Merchant.delete_all
    @merchant1.name = 'Starbucks'
    @merchant1.save
    assert_equal('Starbucks', Merchant.find_all[0].name)
  end

  # def test_view_all_tags
  #   Purchase.delete_all
  #   Merchant.delete_all
  #   Tag.delete_all
  #   @merchant3.save
  #   @tag1.save
  #   @purchase1.save
  #   @purchase2.save
  #   assert_equal('food', @merchant3.tags[0])
  # end

  def test_name_to_title_case
    assert_equal('Amazon', @merchant1.name_to_title_case)
  end

end
