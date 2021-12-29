require 'yaml'
require 'pry'

# puts file_data = File.readlines("#{Dir.home}/.config/alacritty.yml")
config = YAML.load_file("#{Dir.home}/.config/alacritty.yml")
opacity = config["background_opacity"].to_s

action = ARGV[0]

puts opacity
# binding.pry
puts new_opacity = "0." + opacity.split("").last.to_i.send(action, 1).to_s

exit if new_opacity == "0.-1" || new_opacity == "1.1"
puts "ok"
#➜  .config sed -i 's/background_opacity: .../background_opacity: 1.0/' alacritty.yml

# case opacity
# when "1.0"
# when "0.0"
# end

# case x
# when 1..5
#   "It's between 1 and 5"
# when 6
#   "It's 6"
# when "foo", "bar"
#   "It's either foo or bar"
# when String
#   "You passed a string"
# else
#   "You gave me #{x} -- I have no idea what to do with that."
# end
