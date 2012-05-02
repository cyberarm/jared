# Deamon
# TODO: run every x minutes on Linux and Windows

class Deamon
 Lib.db

 def self.task
  # TODO: Add tasks to deamon
  puts "Jared Tasks"
  puts "0 Tasks due today."
 end
 def self.appointment
  # TODO: add appointments to deamon
  puts "Jared Calendar"
  puts "0 Appointments due today."
 end
 def self.message
  # TODO: add messages(emails) to deamon
  # limit to lastest 15 messages
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