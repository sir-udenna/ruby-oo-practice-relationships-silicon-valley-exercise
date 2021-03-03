require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Facebook", "Mark Zuckerburg", "facebook.com")
s2 = Startup.new("Uber", "Reggie Miller", "uber.com")
s3 = Startup.new("Macro & Me", "Emily Nguyen", "macroandme.com")
s4 = Startup.new("DennAnothaOne", "Udenna Nebeolisa", "dennanothaone.com")

v1 = VentureCapitalist.new("Beyonce", 50000)
v2 = VentureCapitalist.new("Rihanna", 200000000000)
v3 = VentureCapitalist.new("Oprah", 30000)

f1 = FundingRound.new(s1, v1, "Angel", 50.000)
f2 = FundingRound.new(s2, v3, "Pre-Seed", 20.000)
f3 = FundingRound.new(s3, v2, "Series A", 70.000)
f4 = FundingRound.new(s1, v1, "Series C", 100.000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line