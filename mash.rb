wives = Array.new
geolocations = Array.new
cars = Array.new
kids = Array.new
jobs = Array.new
money = Array.new
pets = Array.new
mash = ["m","a","s","h"]
ary = [wives,geolocations,cars,kids,jobs,money,pets,mash]
ary2 = ["name of the wife", "a geographical location", "a car name", "number of kids", "job position", "how rich", "pet", "MASH"]


puts "This is a MASH game."


for i in 0..ary.size-2
puts "-----------------------------"
print "Enter ",ary2[i],".\n"

name = gets.to_s
ary[i].push(name)

while name != "\n"
	print "Enter another ", ary2[i] ," or hit enter to move on.\n"
	name = gets.to_s
	ary[i].push(name)
end
end



for i in 0..ary.size
	puts ary[i]
end
