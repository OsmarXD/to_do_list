require "csv"

class List

	def add(task)
		append_task(task)
	end

	def all
		read_csv
	end

	def delete(num)
		read_csv
		task = @list_arr[num]
		@list_arr.delete_at(num)
		rewrite_csv
		task
	end

	def complete(num)
		read_csv
		task = @list_arr[num]
		task.done = !task.done
		rewrite_csv
		task
	end

	def read_csv
		@list_arr = []
		CSV.foreach("MVC.csv","r") do |row|
		   @list_arr << Task.new(row[0],row[1])
		end
		@list_arr
	end

	def rewrite_csv
		CSV.open('MVC.csv', "w") do |csv|
			@list_arr.each do |task|
				csv << [task.name, task.done]
			end
		end
	end

	def append_task(task)
		CSV.open('MVC.csv', "a+") do |csv|
			csv << [task.name, task.done]
		end
	end
end 

class Task
	attr_accessor :name, :done
	def initialize(name, done="false")
		@name = name
		@done = done_boolean(done)
	end


	def done_boolean(done)
		if done == "true"
			true
		else
			false
		end
	end

	def done_box
		if @done == true
			"[x]"
		else
			"[ ]"
		end
	end
end