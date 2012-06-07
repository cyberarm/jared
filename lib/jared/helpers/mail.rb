class Helpers
Lib.db
 # Checks Email on demand.
 def self.mail
 require 'gibberish'
 begin
  @user = User.first
  if @user.mail_username.blank?
   puts "Jared is not configured to check email."
   puts "Please run, 'jared config'"
  elsif @user.mail_password.blank?
   puts "Jared is not configured to check email."
   puts "Please run, 'jared config'"
  else
  cipher = Gibberish::AES.new(@user.mail_username)
  password = cipher.dec(@user.mail_password)
  Gmail.connect(@user.mail_username, password) do |gmail|
   if gmail.logged_in?
   puts "Google Mail"
   puts gmail.inbox.count(:unread).to_s + " Unread messages."
   gmail.inbox.emails(:unread).each do |email|
    email.unread!
	print "From:",email.sender[0].mailbox,"@", email.sender[0].host, ", Subject:",email.subject
	puts
    end
	else
	puts "Not logged in."
	end
   end
  end
    rescue => e
	if e.to_s.include?("mail_")
	 puts "Jared is not configured to check email."
	 puts "Please run, 'jared config' or click 'OK' on the popup."
    end
  end
 end
end