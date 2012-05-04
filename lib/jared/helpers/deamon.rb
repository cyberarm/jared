# = Deamon
# TODO: run every x minutes on Linux and Windows

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
 # TODO:
 # limit messages to lastest 15
 def self.message
  @user = User.first
  Gmail.connect(@user.mail_username, @user.mail_password) do |gmail|
   puts "Google Mail"
   puts gmail.inbox.count(:unread).to_s + " Unread messages."
   gmail.inbox.emails(:unread).each do |email|
    email.unread!
	print "From:",email.sender[0].mailbox,"@", email.sender[0].host, ", Subject:",email.subject
	puts
   end
  end
 end
end

class Helpers
# Checks every 60 seconds for, Tasks, Appointments, Emails.
 def self.deamon
  loop do
    Deamon.task
    Deamon.appointment
    Deamon.message
	puts
	puts
	sleep(60)
   end
  end
 end