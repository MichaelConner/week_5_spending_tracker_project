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

  # def test_can_find_all_tags
  #   Tag.delete_all
  #   @tag1.save
  #   @tag2.save
  #   assert_equal([@tag1, @tag2], Tag.find_all)
  # end
  #
  # def test_can_find_one_tag_by_id
  #   Tag.delete_all
  #   @tag2.save
  #   assert_equal(@tag2, Tag.find_by_id(@tag2.id))
  # end

  def test_can_delete_all_tags
    @tag2.save
    Tag.delete_all
    assert_equal([], Tag.find_all)
  end

  # def test_can_delete_one_tag_by_id
  #   @tag2.save
  #   Tag.delete_by_id(@tag2.id)
  #   assert_true(,)
  # end

  # def test_tag_can_update
  #
  # end




end
