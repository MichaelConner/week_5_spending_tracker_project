require('minitest/autorun')
require('minitest/rg')

require_relative('../models/tags')

class TagsTest < MiniTest::Test

  def setup
    @tag1 = Tag.new('type' => 'entertainment')
    @tag2 = Tag.new('type' => 'travel')
  end

  def test_tag_has_name
    assert_equal("entertainment", @tag1.type)
  end

  def test_tag_has_id__false
    assert_nil(@tag1.id)
  end

  def test_tag_has_id__true
    @tag1.save
    assert_equal(true, @tag1.id > 0)
  end

  def test_can_find_all_tags
    Tag.delete_all
    @tag1.save
    @tag2.save
    assert_equal(@tag1.id, Tag.find_all[0].id)
    assert_equal(@tag2.id, Tag.find_all[1].id)
  end

  def test_can_find_one_tag_by_id
    Tag.delete_all
    @tag2.save
    assert_equal(@tag2.id, Tag.find_by_id(@tag2.id).id)
  end

  def test_can_delete_all_tags
    @tag1.save
    @tag2.save
    Tag.delete_all
    assert_equal([], Tag.find_all)
  end

  def test_can_delete_one_tag
    Tag.delete_all
    @tag2.save
    Tag.delete_by_id(@tag2.id)
    assert_equal([], Tag.find_all)
  end

  def test_tag_can_update
    Tag.delete_all
    @tag1.type = 'candles'
    @tag1.save
    assert_equal('candles', Tag.find_all[0].type)
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

  def test_type_to_title_case
    assert_equal('Travel', @tag2.type_to_title_case)
  end

end
