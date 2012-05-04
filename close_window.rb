require "rautomation"

class CloseWindow
  attr_writer :window, :button

   # creates an instance variable with the window's name
   def window_search(window_name)
     # window title with regexp
     @window = RAutomation::Window.new(:title => /#{window_name}/i)
   end

   # does window exists - returns true if yes
   def window_exists?
     @window.exists?
   end

   # close window name
   def window_close
     @window.close
   end

   # a message
   def window_does_not_exist
     puts("Window named #{@window.title} does not exist")
   end

   #is the number of parameters different than 2?
   #ARGV is special function that takes parameter from command prompt
   def wrong_num_parameters?
     (ARGV.size != 1)
   end

   def wrong_num_parameters_message
     puts("Usage: script \"<window_name>\"")
     puts("[!] I need window name in order to close it")
   end

   begin
     # new instance
     app = CloseWindow.new

     # is the number of arguments ok?
     if app.wrong_num_parameters? #ARGV.size != 1
       app.wrong_num_parameters_message
       exit!
     end

     # first argument has to be the the window name
     app.window_search(ARGV[0])

     # does the window exists? (if not exit)
     if app.window_exists?
       app.window_close
     else
       app.window_does_not_exist
       exit!
     end

   rescue Exception => e
     puts e.message
     puts e.backtrace.inspect
   end
end