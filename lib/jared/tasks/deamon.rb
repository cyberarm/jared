# == Deamon
#
# Functions for deamon command.
class Deamon
  Lib.db
  # TODO: Add tasks to deamon
  def self.task
    puts "Jared Tasks"
    puts "0 Tasks due today."
  end

  # TODO: add appointments to deamon
  #
  # NOTE: Research Google Calendar
  def self.appointment
    puts "Jared Calendar"
    puts "0 Appointments occurring today."
    puts "Google Calendar"
    puts "x Appointments occurring today"
  end

  # Actually checks mail.
  def self.message
    begin
      @user = User.first
      if @user.mail_username.blank?
        puts "Jared is not configured to check email."
        puts "Please run, 'jared config'"
        Kernel.exit
      elsif @user.mail_password.blank?
        puts "Jared is not configured to check email."
        puts "Please run, 'jared config'"
        Kernel.exit
      else
        cipher = Gibberish::AES.new(@user.mail_username)
        password = cipher.dec(@user.mail_password)
        Gmail.connect(@user.mail_username, password) do |gmail|
          if gmail.logged_in?
            if gmail.inbox.count(:unread) == 0
            else
              puts "Google Mail"
              puts gmail.inbox.count(:unread).to_s + " Unread messages."
              gmail.inbox.emails(:unread).first(15).each do |email|
                email.unread!
                print "From:",email.sender[0].mailbox,"@", email.sender[0].host, ", Subject:",email.subject
                puts
                puts
              end
            end
          else
            puts "Failed to login."
            Kernel.exit
          end
        end
      end
    end
    rescue => e
      if e.to_s.include?("mail_")
        puts "Jared is not configured to check email."
        puts "Please run, 'jared config' or click 'OK' on the popup."
        Kernel.exit
      end
    end
  end
end

class Task
  class Daemon
    # Checks every 60 seconds for, Tasks, Appointments, Emails.
    #
    # Usage: <em>jared deamon (task/cal/mail)</em>
    def deamon
      if ARGV[1] == nil
        Helpers.mail
        loop do
          Deamon.message
          Deamon.task
          Deamon.appointment
          puts
          puts
          sleep(60)
        end
      elsif ARGV[1] == "cal" || ARGV[1] == "calendar"
        loop do
          Deamon.appointment
          puts
          sleep(60)
        end
      elsif ARGV[1] == 'mail'
        Helpers.mail
        loop do
          Deamon.message
          sleep(60)
        end
      elsif ARGV[1] == "task"
        loop do
          Deamon.task
          puts
          sleep(60)
        end
      end
    end
  end
 end