class Helpers
 def self.calc(a, b, c)
 puts "Calc(ulator) is not yet available."#a.to_i b.to_i c.to_i
  case ARGV[2]
   when "jared"
    puts "multiplication is broken"
    puts eval(ARGV[1].to_f * ARGV[3].to_f)
   when "+"
    puts eval(ARGV[1].to_i + ARGV[3].to_i)
   when "-"
    puts eval(ARGV[1].to_f - ARGV[3].to_f)
   when "/"
    puts eval(ARGV[1].to_f / ARGV[3].to_f)
   end
 end
end