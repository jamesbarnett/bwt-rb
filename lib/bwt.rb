require_relative "./bwt/version"

module Bwt
  def rotate(str, index=0)
    str[index+1..-1] + str[0..index]
  end

  def encode(str)
    ps = sorted_rotations(str)
    [last_column(ps), ps.find_index(str)]
  end

  def sorted_rotations(str)
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
    ps = [""] * encoded.first.length

    cs = encoded.first * encoded.first.length
    indices = (0..encoded.first.length-1).to_a * encoded.first.length

    cs.chars.zip(indices).each do |c, i|
      ps[i] = c + ps[i]
      ps.sort! if i == encoded.first.length - 1
    end

    ps[encoded.last]
  end
end

