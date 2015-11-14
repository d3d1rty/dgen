# PassGen Class tester
# Copyright 2015 Richard Davis GPL v3
require 'test/unit'
require 'dgen/passgen'

# tests the PassGen class
class PassGenTest < Test::Unit::TestCase
  def test_roll_nums
    assert_match(/^\d{5}$/, PassGen.new.roll_nums)
  end

  def test_find_word
    file = File.new('lib/assets/word-list.txt', 'r+')
    num = '11111'
    assert_equal(PassGen.new.find_word(file, num), 'a')
  end

  def test_make_phrase
    words = %w(this is a test just a test)
    assert_equal(PassGen.new.make_phrase(words), 'this is a test just a test')
  end

  def test_generate_phrase
    n_words = 6
    p_length = 17
    file = File.new('lib/assets/word-list.txt', 'r+')
    assert_match(/\w||\s{17,}/, PassGen.new.generate_phrase(n_words, p_length, file))
  end
end
