require_relative "./bwt/version"

module Bwt
  def rotate(str, index=0)
    str[index+1..-1] + str[0..index]
  end

  def encode(str)
    ps = sorted_permutations(str)
    [last_column(ps), ps.find_index(str)]
  end

  def sorted_permutations(str)
    ps = [str]
    0.upto(str.size - 2) do |i|
      ps << rotate(str, i)
    end
    ps.sort
  end

  def last_column(ps)
    ps.map {|p| p[-1] }.join
  end

  def decode(encoded)
    ps = [""]
    pindex = 0

    while ps.any? {|px| px.size < encoded.first.size} do
      encoded.first.each_char do |c|
        ps[pindex] ||= ""
        ps[pindex].prepend c
        pindex = pindex + 1
      end
      pindex = 0
      ps.sort!
    end

    ps[encoded.last]
  end
end

