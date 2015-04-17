#!/usr/bin/env ruby

module Bwt
  class MoveToFrontDecoder
    attr_accessor :encoded, :min_value_set

    def initialize(encoded, min_value_set)
      self.encoded = encoded
      self.min_value_set = min_value_set
    end

    def decode
      decoded = []
      buffer = self.min_value_set.dup

      encoded.each do |x|
        decoded << buffer[x]

        if x > 0
          temp = decoded.last
          buffer.delete_at x
          buffer.unshift(temp)
        end
      end

      decoded.join
    end
  end
end
