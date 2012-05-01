class Helpers
 def self.task
 ActiveRecord::Base.establish_connection(
 :adapter => 'sqlite3',
 :database => "#{Dir.home}/.jared.sqlite3")
  require "green_shoes"
  require_relative "models/task.rb"
  Shoes.app title: "Jared Tasks" do
   title "Tasks"
      button "add task" do
     Shoes.app  title: "Add Task", width: 250, height: 400 do
      title "add task"
       stack do
        para "Task title:"
         @title = edit_line text: ""
        para "Task desciption:"
         @desciption = edit_box text: ""
        para "Task due date:"
         @due = edit_line text: ""
        button "Add Task" do
         new_task = Task.new(:title => @title.text, :desciption => @desciption.text, :due => @due.text)
         new_task.save!
         if new_task
          alert "added task"
          close
         else
          alert "failed to add task. Make sure you use a unique title"
         end
        end
       end
      end
      end
       button "Refresh" do
         $tasks_s.clear do
          $tasks_s = stack do
           task = Task.find(:all) 
           task.each do |t|
            tagline t.title
            tagline "Desciption:"
            para t.desciption
            tagline "Due:"
            para t.due
            flow do
            button "Edit", state: "nil" do
             Shoes.app  title: "Editing Task: #{t.title}", width: 250, height: 400 do
             title "edit task"
              stack do
               para "Task title:"
                @title = edit_line text: "#{t.title}"
               para "Task desciption:"
                @desciption = edit_box text: "#{t.desciption}"
               para "Task due date:"
                @due = edit_line text: "#{t.due}"
               button "update Task" do
                task = Task.find(t.id)
                @edit_task = task.update_attributes(:title => @title.text, :desciption => @desciption.text, :due => @due.text)
                close
               end
              end
             end
            end
            button "Delete" do
              delete = confirm "Deleting... Are you sure?"
              if delete == true
               Task.destroy(t.id)
               alert "removed #{t.title}" 
              end
            end
            para
           end
          end
         end
         end
        end
    task = Task.find(:all)
    $tasks_s = stack do
    task.each do |t|
     tagline t.title
     tagline "Desciption:"
     para t.desciption
     tagline "Due:"
     para t.due
     flow do
     button "Edit", state: "nil" do
      Shoes.app  title: "Editing Task: #{t.title}", width: 250, height: 400 do
      title "edit task"
       stack do
        para "Task title:"
         @title = edit_line text: "#{t.title}"
        para "Task desciption:"
         @desciption = edit_box text: "#{t.desciption}"
        para "Task due date:"
         @due = edit_line text: "#{t.due}"
        button "update Task" do
         task = Task.find(t.id)
         @edit_task = task.update_attributes(:title => @title.text, :desciption => @desciption.text, :due => @due.text)
         close
        end
       end
      end
     end
     button "Delete" do
       delete = confirm "Deleting... Are you sure?"
       if delete == true
        Task.destroy(t.id)
        alert "removed #{t.title}" 
       end
     end
     para
    end
   end  
  end
  end
  end
end