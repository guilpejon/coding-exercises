# Given apartment blocks with some buildings in it 
#   true is when the building is in that block
#   false is when it's not
# Find the best place to live based on where you would have to walk
# the least to reach all the buildings listed in "requirements"

blocks = [
  {
    gym: false,
    school: true,
    store: false
  },
  {
    gym: true,
    school: false,
    store: false
  },
  {
    gym: true,
    school: true,
    store: false
  },
  {
    gym: false,
    school: true,
    store: false
  },
  {
    gym: false,
    school: true,
    store: true
  },
]
requirements = ["gym", "school", "store"]
puts "#" * 50

# go through each block
#   blocks[0] => { gym: 1, school: 0, store: 4}
#   blocks[1] => { gym: 0, school: 1, store: 3}
#   blocks[2] => { gym: 0, school: 0, store: 2}
#   blocks[3] => { gym: 1, school: 0, store: 1}
#   blocks[4] => { gym: 2, school: 0, store: 0}

blocks_dist = []
blocks.each_with_index do |b, index|
  blocks_dist[index] = {}
  requirements.each do |req|
    blocks_dist[index].merge!(
      {
        "#{req}": b[req.to_sym] == true ? 0 : nil
      }
    )
  end
  blocks_dist[index].merge!({max: -1})
end

puts blocks_dist
puts "#" * 50

blocks_dist.each_with_index do |b, index|
  requirements.each do |req|
    if b[req.to_sym] == 0
      # fill values before the building
      (0..index-1).each do |t|
        blocks_dist[t][req.to_sym] = index - t if blocks_dist[t][req.to_sym].nil?
      end
      # fill values after the building
      (index+1..blocks_dist.size-1).each do |t|
        blocks_dist[t][req.to_sym] = t - index unless blocks_dist[t][req.to_sym] == 0
      end
    end
  end
end

max = 99999
right_index = -1
blocks_dist.each_with_index do |b, index|
  if b.values.max < max
    max = b.values.max
    right_index = index
  end
end

puts blocks_dist
puts "#" * 50
puts "ANSWER=#{right_index}"
