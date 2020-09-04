#set filetype=ruby
Pry.config.editor = 'nvim'

Pry.config.commands.alias_command "4", "ls -l"
Pry.commands.alias_command "1", "!!!"
Pry.commands.alias_command "2", "next"
Pry.commands.alias_command "4", "whereami"
Pry.commands.alias_command "5", "step"

# Hit Enter to repeat last command
#Pry::Commands.command /^$/, "repeat last command" do
#  pry_instance.run_command Pry.history.to_a.last
#end

#module RunCommandsPatch
#  def run_commands(*commands)
#    commands.each { |command| run_command(command) }
#  end
#end
#
#Pry.prepend(RunCommandsPatch)

#Pry::Commands.commands "sl", "step and list all" do
#  pry_instance.run_commands ["step", "ls -l"]
#end

#Pry::Commands.command "sl", "step and list all" do
#  pry_instance.run_commands(["step", "ls -l"])
#end


Pry::Commands.block_command /^$/, 'step and list all' do
  pry_instance.input = StringIO.new("step\nls -l\n")
end

Pry::Commands.block_command "8", 'finish and list all' do
  pry_instance.input = StringIO.new("finish\nls -l\n")
end

Pry::Commands.block_command "9", 'continue and list all' do
  pry_instance.input = StringIO.new("continue\nls -l\n")
end

