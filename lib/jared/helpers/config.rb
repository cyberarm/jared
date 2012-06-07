class Helpers
Lib.db
# Opens a Green Shoes window to configure your name, zipcode, gmail username, gmail password.
 def self.config
  require 'gibberish'
  Shoes.app title: "Jared - Configuration", height: 300, width: 500 do
   background "#333".."#666"
   tagline "Configure Jared to your person"
   @user = User.first
   if @user.blank?
    button "Create profile" do
	 new_user = User.new(:name => "#{Etc.getlogin}", :zip => "10001")
	 new_user.save
	 if new_user == true
	 exit
	 Helpers.config
	 else
	  alert "Failed. Retry."
	end
   end
   else
    para 'Your name:'
    @name = edit_line "#{@user.name}"
	  para 'Your zipcode (For weather)'
	  @zip = edit_line "#{@user.zip}"
	  para 'Prefered music genre (For jamendo)'
	  @music = list_box items: ['classical', 'rock', 'jazz', 'electro', 'hiphop'].sort
	  para 'Your Gmail email address (For email checking)'
	  @mail = edit_line "#{@user.mail_username}"
	  para 'Your Gmail password (Will be encrypted)'
	  @password = edit_line "#{@user.mail_password}", secret: true
	  button "Save" do
	    cipher = Gibberish::AES.new(@mail.text)
	    @secret = cipher.enc(@password.text)
	    update_user = @user.update_attributes(:name => @name.text, :zip => @zip.text, :music => @music.text, :mail_username => @mail.text, :mail_password => @secret)
	    if update_user
	     alert "Saved."
	     close
	    else
	     alert "failed to save."
	    end
	   end
    end
   end
  end
end