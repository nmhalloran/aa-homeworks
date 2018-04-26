def sluggish_octopus(fish)
  longest_fish = fish[0]
  (0...fish.length).each do |idx1|
    if fish[idx1].length > longest_fish.length
      longest_fish = fish[idx1]
    end
    (idx1 + 1...fish.length).each do |idx2|
      if fish[idx2].length > longest_fish.length
        longest_fish = fish[idx2]
      end
    end
  end
  longest_fish
end

def merge_sort(fish)

  return fish if fish.length <= 1

  mid = fish.length / 2
  sorted_left = merge_sort(fish.take(mid))
  sorted_right = merge_sort(fish.drop(mid))

  merge(sorted_left, sorted_right)
end

class Array
  #this should look familiar
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

def dominant_octopus(fish)
  # sort the array longest to shortest
  prc = Proc.new { |x, y| y.length <=> x.length }
  #return the first element
  fish.merge_sort(&prc)[0]
end

def clever_octopus(fish)

  longest_fish = fish[0]

  fish.each do |fish1|
    if fish1.length > longest_fish.length
      longest_fish = fish1
    end
  end

  longest_fish

end

fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

p sluggish_octopus(fish_array)
p dominant_octopus(fish_array)
p clever_octopus(fish_array)
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)

  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end

# FULL DISCLOSURE. I did not understand exactly what the directions were asking for fast dance. I think I'm missing a small piece of Big O. The rest of it was very clear. Below is from the solution. Thank you!
tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
