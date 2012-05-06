class Helpers
 # Not yet implemented.
 #
 # Calculates.
 def self.calc
 puts "Calc(ulator) is not yet available."
 Kernel.exit
  case ARGV[2]
   when "jared"
    puts "multiplication is broken"
    puts eval(ARGV[1].to_i * ARGV[3].to_i)
   when "+"
    puts eval(ARGV[1].to_i + ARGV[3].to_i)
   when "-"
    puts eval(ARGV[1].to_i - ARGV[3].to_i)
   when "/"
    puts eval(ARGV[1].to_i / ARGV[3].to_i)
   end
 end
end