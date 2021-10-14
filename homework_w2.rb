require 'json'

file = File.read('grades.json') 
student = JSON.parse(file)

average_grade = student.sum{|student| student['grade']} / student.count

def failedorpassed(array,status)
    array.each_with_index do |n,i|

        if i <= array.count - 3
           print "#{n['name']}, "  
        elsif i == array.count - 2
            print "#{n['name']} and "
        else
            print "#{n['name']} #{status}"
        end 
        
    end
end

puts "Average grade is #{average_grade}"

failed = student.select{ |student| student['grade'] < average_grade }
failedorpassed(failed, "are failed\n")

passed = student.select{ |student| student['grade'] >= average_grade }
failedorpassed(passed, "are passed")

