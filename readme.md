# Jared - Ruby Powered Digital Assistant (RDA)
## What is Jared?
Jared's goal is to be a reality of Jarvis from the film, Ironman.

However, thats a **long** ways down the road, starting Jared small and working slowly up to the end goal of a voice-activated house control A.I.
## Install Jared
You can get the lasest stable release on RubyGems via *gem install jared*

You can also get the unstable version from <a href="https://github.com/cyberarm/jared">github</a>.

## Usage

### Clock
  Opens a digital clock in a Green Shoes app.
  
  Usage: jared clock

### Cal
  <span style="color:red;">Not yet implemented.</span>
  
  Manage your appointments.

  Usage: jared cal
  
### Day
  Puts current day.
  
  Usage: Jared day
  
  Tuesday
  
### Deamon
  Run mail/task/appointment check every 60 seconds.
  
  Usage: jared deamon (mail/task/cal(endar))
  
  (if there is no second argument it'll check all three every 60 seconds.)
  
### Date
  Puts the current date.
  
  Usage: jared date
  
  Wednesday the 22nd of February 2012
  
  (02/22/2012)
  
### Mail
  Checks Gmail for new mails.
  
  Usage: jared mail
  
### Task
  Manage your tasks.
  
  Opens a Green Shoes window for managing Tasks.

  Usage: jared task

### Time
  puts the current time
  
  Usage: jared time
  
  05:21 am

### Weather
  Check you local weather information.

  Usage: jared weather (today/tomorrow/forecast)

### Whatis
  <span style="color:red;">Not yet implemented.</span>
  
  Google's the definition of the word.
  
  Usage: jared whatis glass
  
### Whereis
  Opens Gmaps in default browser.

  Usage: jared whereis PLACE
 
### View
  Opens the file in the system viewer.
  
  Usage: jared view jared.rb
