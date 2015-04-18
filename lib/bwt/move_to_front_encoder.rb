#!/usr/bin/env ruby

module Bwt
  class MoveToFrontEncoder
    attr_accessor :str, :min_value_set

    def initialize(str)
      self.str = str
      self.min_value_set = find_min_value_set
    end

    def encode
      encoded = []
      buffer = self.min_value_set.dup

      self.str.each_char do |c|
        encoded << buffer.find_index(c)

        if encoded.last > 0
          temp = buffer[encoded.last]
          buffer.delete_at encoded.last
          buffer.unshift temp
        end
      end

      encoded
    end

    private

    def find_min_value_set
      cs = []
      self.str.each_char {|c| cs << c }
      cs.uniq.sort
    end
  end
end
