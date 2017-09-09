require 'byebug'


def trim(array, interval)
     running = true
     interval_counter = 1
     inner_pointer = 0
     outer_pointer = 0
     flags = Array.new(array.length, false)
     while(running)
          if(check_flags(flags))
               break
          end
          if(inner_pointer >= array[outer_pointer].length)
               inner_pointer = 0
               outer_pointer += 1
               if(outer_pointer == array.length)
                    outer_pointer = 0
               end
          end
          while(flags[outer_pointer])
               outer_pointer += 1
               inner_pointer = 0
               if(outer_pointer == array.length)
                    outer_pointer = 0
               end
          end
          if(interval_counter == interval)
               interval_counter = 0
               if(array[outer_pointer].length == 1)
                    flags[outer_pointer] = true
               end
               if(!flags[outer_pointer])
                    array[outer_pointer].delete_at(inner_pointer)
                    inner_pointer -= 1
                    if(array[outer_pointer].length == 1)
                         array[outer_pointer] = array[outer_pointer].join("")
                         flags[outer_pointer] = true
                    end
               end
          end
          interval_counter += 1
          inner_pointer += 1
     end
     return array
end

def check_flags(flags)
     return flags.all?
end


#declaring all the arrays we will be working on.
wives = ["kristina", "amy"]
geolocations = ["ny","sf"]
cars = ["bmw","audi"]
kids = [1,3]
jobs = ["ceo","cfo"]
money = ["broke","millionare"]
pets = ["cat","dog"]
mash = ["Mansion","Apartment","Shack","House"]
ary = [wives,geolocations,cars,kids,jobs,money,pets,mash]
ary2 = ["name of the wife", "a geographical location", "a car name", "number of kids", "job position", "how rich", "pet", "MASH"]
ary3 = ["You will be married to: ", "You will live in: ", "You will drive a: ", "You will have this many kid(s): ", "You will be working as a: ", "You will have this much money: ", "And your pet will be a: ", "And finally you will be living in a: "]


puts "This is a MASH game."

# for i in 0..ary.size-2
# 	puts "-----------------------------"
# 	print "Enter ",ary2[i],".\n"

# 	name = gets.to_s

# 	while name == "\n"
# 		print "Don't be silly. You need to at least enter one ",ary2[i], ". Enter ",ary2[i],".\n"
# 		name = gets.to_s
# 	end


# 	while name != "\n"
# 		ary[i].push(name)
# 		print "Enter another ", ary2[i] ," or hit enter to move on.\n"
# 		name = gets.to_s
# 	end
# end


#prompt user to enger an interval that removes entries from arrays.
puts ("Now, enter an integer. This is a very important number as it will decide your fate. Hit enter for random number.")

input = gets.to_i

if input == 0
	interval = rand(0..10)
else
	interval = input.to_i
end


puts ("Here is your original entries:")

for i in 0..ary.size - 1
	puts "----------------------"
	puts ary3[i]
	puts ary[i]
end

puts (trim(ary,interval))
#result = trim(ary,interval)

# puts "----------------------"
# puts "and here is your fate:"


# for i in 0..result.size - 1
# 	print ary3[i]
# 	print(result[i],". ")
# end
