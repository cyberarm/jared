class Helpers
 # Opens a Green Shoes app to manage tasks.
 def self.task
 Lib.db
  require "green_shoes"
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
         new_task = Task.new(:title => @title.text, :desciption => @desciption.text, :due => Chronic.parse(@due.text))
         new_task.save!
         if new_task
          alert "added task"
          close
         else
          alert "failed to add task. Make sure you use a unique title."
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
            para t.desciption
            puts t.due.to_s
            puts Time.new(t.due.to_s)
            para "Due: " + Time.new(t.due.to_s).strftime("%B %d %Y")
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
                @due = edit_line text: "#{Time.new(t.due.to_s).strftime("%B %d %Y")}"
               button "update Task" do
                task = Task.find(t.id)
                @edit_task = task.update_attributes(:title => @title.text, :desciption => @desciption.text, :due => Chronic.parse(@due.text))
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
     para t.desciption
     para "Due: #{Time.new(t.due.to_s).strftime("%B %d %Y")}"
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
         @due = edit_line text: "#{Time.new(t.due.to_s).strftime("%B %d %Y")}"
        button "update Task" do
         task = Task.find(t.id)
         @edit_task = task.update_attributes(:title => @title.text, :desciption => @desciption.text, :due => Chronic.parse(@due.text))
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