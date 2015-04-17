require 'minitest/autorun'
require_relative "../lib/bwt/move_to_front_encoder"

module Bwt
  describe MoveToFrontEncoder do
    it "encodes a s simple string" do
      mtf = MoveToFrontEncoder.new "nnbaaa"
      mtf.encode.must_equal [2, 0, 2, 2, 0, 0]
    end

    it "finds the minimum value set" do
      mtf = MoveToFrontEncoder.new "nnbaaa"
      mtf.min_value_set.must_equal %w[a b n]
    end
  end
end
