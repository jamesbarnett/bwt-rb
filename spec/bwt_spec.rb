require 'minitest/autorun'
require_relative '../lib/bwt'

describe Bwt do
  include Bwt

  it "rotates a string" do
    rotate("banana").must_equal "ananab"
  end

  it "sorts rotations" do
    sorted_rotations("banana").first.must_equal "abanan"
  end

  it "encodes correctly" do
    result = encode("banana")
    result.must_equal ["nnbaaa", 3]
  end

  it "encodes and decodes" do
    decode(encode("banana")).must_equal "banana"
  end

  it "encodes and decodes UTF-8" do
    decode(encode("åßç∂")).must_equal "åßç∂"
  end
end
