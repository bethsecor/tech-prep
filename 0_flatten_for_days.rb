def flatten(flattened = [], nums)
  nums.each do |thing|
    if thing.class == Array
      flatten(flattened, thing)
    else
      flattened << thing
    end
  end
  flattened
end

nums = [1, 2, 3, [4, 5, [6, 7]]]

p nums
p flatten(nums)
