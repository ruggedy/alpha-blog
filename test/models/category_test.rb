require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end

  test "Test to see if this exists" do
    assert @category.valid?
  end

  test "Name should be present " do
    @category.name = ""
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end

  test " maximum length name" do
    @category.name = "a"*26
    assert_not @category.valid?
  end

  test "minimum length name" do
    @category.name = "aa"
    assert_not @category.valid?
  end

end
