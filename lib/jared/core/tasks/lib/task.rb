require "green_shoes"
require "chronic"
require_relative "../../../database"

module JCPFT
  module Extensions
    def draw_tasks_list
      Task.all.each do |task|
        caption "Task: #{task.title}"
        para "Due: #{Time.parse(task.parsed_due.to_s).strftime("%A, %B %d %Y")}"
        para "#{task.description}"
        inscription
        flow do
          button "Edit" do
            create_or_edit_task(task.id,$content_div)
          end

          button "Delete" do |delete_button|
            check = confirm "Are you sure?"
            if check
              Task.destroy(task.id)
              $redraw_ui = true
              delete_button.state = 'disabled'
            end
          end
        end
        inscription
      end
    end

    def create_or_edit_task(task,content_div)
      if task == :false
        method = 'Create'
      else
        method = 'Edit'
        task = Task.find(task)
      end

      window title: "#{method} Task" do
        stack margin_left: 20 do
          para "Title:"
          if method == 'Edit'
            @title = edit_line "#{task.title}"
          else
            @title = edit_line ""
          end

          para "Due"
          if method == 'Edit'
            @due = edit_line "#{task.due}"
          else
            @due = edit_line ""
          end

          para "Description"
          if method == 'Edit'
            @description = edit_box "#{task.description}"
          else
            @description = edit_box ""
          end

          button "Save" do
            if method == 'Create'
              task = Task.new(:title => @title.text, :description => @description.text, :due => @due.text, :parsed_due => Chronic.parse(@due.text))
              begin
                if task.save!
                  $redraw_ui = true
                  close
                else
                  alert "Task failed to save, try again."
                end
              rescue => e
                alert "Error: #{e}"
              end
            else
              if task.update_attributes(:title => @title.text, :description => @description.text, :due => @due.text, :parsed_due => Chronic.parse(@due.text))
                $redraw_ui = true
                close
              end
            end
          end
        end
      end
    end
  end
end

class Action
  class Tasks
    def time_parse(time)
      Time.parse(time.to_s).strftime("%A, %B %dth %Y")
    end

    # Opens a Green Shoes app to manage tasks.
    def task
      Lib.db
      Shoes.app title: "Jared Tasks" do
        extend JCPFT::Extensions

        every 0.5 do
          if $redraw_ui
            $content_div.clear do
              draw_tasks_list
            end
            $redraw_ui = false
          end
        end

        stack margin_left: 20
        title "Tasks"
        flow do
          button "Create Task" do
            create_or_edit_task(:false,$content_div)
          end
        end

        $content_div = stack do
          draw_tasks_list
        end
      end
    end
  end
end

Action::Tasks.new.task