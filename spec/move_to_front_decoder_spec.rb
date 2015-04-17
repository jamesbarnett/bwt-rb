require 'minitest/autorun'
require_relative "../lib/bwt/move_to_front_decoder"

module Bwt
  describe MoveToFrontDecoder do
    it "decodes a value" do
      decoder = MoveToFrontDecoder.new [2, 0, 2, 2, 0, 0], %w[a b n]
      decoder.decode.must_equal "nnbaaa"
    end
  end
end

