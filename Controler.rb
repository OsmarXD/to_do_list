require_relative "View"
require_relative "Model"

class MainController
	def initialize(argv)
		@view = MainView.new
		@argv = argv
		@list = List.new
		@command = argv[0]
		@string = argv[1..-1].join(" ")
		command_selector(@command)
		
	end

	def command_selector(command)
		
		if command == "add"
			add
		elsif command == "index"
			index
		elsif command == "delete"
			delete(@string.to_i-1)
		elsif command == "complete"
			complete(@string.to_i-1)
		else
			@view.command_error(@command)
		end
	end 

	def index
		tasks = @list.all
		@view.index(tasks)
	end

	def add
		task = Task.new(@string)
		@list.add(task)
		index
	end

	def delete(num)
		task = @list.delete(num)
		@view.delete(task)
		index
	end

	def complete(num)
		task = @list.complete(num)
		@view.complete(task)
		index
	end
end

MainController.new(ARGV)