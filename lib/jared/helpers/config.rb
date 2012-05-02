class Helpers
Lib.db

 def self.config
  Shoes.app title: "Jared - Configuration", height: 300, width: 500 do
   background "#333".."#666"
   tagline "Configure Jared to your person"
   @user = User.first
   if @user.blank?
    button "Create profile" do
	 new_user = User.new(:name => "#{Etc.getlogin}", :zip => "00000")
	 new_user.save
	 if new_user
	  alert "Success. Rerun command `jared config` to continue."
	  close
	 else
	  alert "Failed. Retry."
	end
   end
   else
    para 'Your name:'
    @name = edit_line "#{@user.name}"
	para 'Your zipcode (For weather)'
	@zip = edit_line "#{@user.zip}"
	para 'Your Gmail email address (For email checking)'
	@mail = edit_line "#{@user.mail_username}"
	para 'Your Gmail password (Will be encrypted)'
	@password = edit_line "#{@user.mail_password}", secret: true
	button "Save" do
	  update_user = @user.update_attributes(:name => @name.text, :zip => @zip.text, :mail_username => @mail.text, :mail_password => @password.text)
	  if update_user == true
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