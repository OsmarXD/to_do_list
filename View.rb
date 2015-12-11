class MainView

	def index(tasks)
		tasks.each_with_index do |task,index|

			puts "#{index+1}. #{task.done_box} #{task.name}"
		end
	end

	def command_error(command)
		puts "unknown command: #{command}"
	end

	def delete(task)
		puts "Eliminaste la tarea: #{task.name} de tu lista"
	end

	def complete(task)
		puts "Completaste la tarea: #{task.name} de tu lista"
	end
end