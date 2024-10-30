require 'date'

class Student 
    @@students = []
    attr_accessor :surname, :name, :date_of_birth

    def initialize(surname, name, date_of_birth)
        @surname = surname
        @name = name 
        @date_of_birth = Date.parse(date_of_birth)  

        
    end

    def calculate_age
            age_in_days = (Date.today - @date_of_birth).to_i 
            age_in_years = age_in_days / 365 
            age_in_years  
    end

    def self.add_student(student)
       if student.date_of_birth >= Date.today
            puts "Некорректная дата рождения для #{student.name} #{student.surname}."
        # Проверка на существование дубликатов
        elsif @@students.any? { |s| s.surname == student.surname && s.name == student.name && s.date_of_birth == student.date_of_birth }
            puts "Студент с такими параметрами уже существует (#{student.name} #{student.surname} #{student.date_of_birth})."
        else
            @@students << student  # Добавление студента
            puts "Студент #{student.name} #{student.surname} успешно добавлен."
        end
    end

    def self.remove_student(surname, name, date_of_birth)

    student_to_remove = @@students.find { |s| s.surname == surname && s.name == name && s.date_of_birth == Date.parse(date_of_birth) }
     if student_to_remove
            @@students.delete(student_to_remove)
            puts "Студент #{name} #{surname} успешно удален."
        else
            puts "Студент с такими параметрами отсутствует (#{name} #{surname} #{date_of_birth})."
        end
    end
    
 def self.get_students_by_age(age)
        students_with_same_age = @@students.select { |student| student.calculate_age == age }
        if students_with_same_age.empty?
            puts "Студенты с возрастом '#{age}' не найдены."
        else
            puts "Студенты с возрастом '#{age}':"
            students_with_same_age.each do |student|
                puts "#{student.name} #{student.surname}, Возраст: #{student.calculate_age}"
            end
        end
    end

    def self.get_students_by_name(name)
      students_with_same_name = @@students.select { |student| student.name == name }
      if students_with_same_name.empty?
          puts "Студенты с именем '#{name}' не найдены."
      else
          puts "Студенты с именем '#{name}':"
          students_with_same_name.each do |student|
              puts "#{student.name} #{student.surname}, Возраст: #{student.calculate_age}"
          end
      end
  end

    def self.all_students
      @@students
    end

end
Student.add_student(Student.new("Nazarenko", "Max", "2006-11-17"))
Student.add_student(Student.new("Nazarenko", "Max", "2006-11-17"))
Student.add_student(Student.new("Ivanova", "Anna", "20055-05-20")) 
Student.add_student(Student.new("Nazarenko", "Olga", "1990-07-27")) 
Student.add_student(Student.new("Petrov", "Petr", "2004-02-15"))   
Student.add_student(Student.new("Ivanov", "Max", "2000-12-17")) 
Student.add_student(Student.new("koblik", "Diana", "2006-11-17"))


Student.remove_student("Petrov", "Petr", "2004-02-15")
Student.get_students_by_name("Max")
Student.get_students_by_age(17)

puts "Все студенты:"
Student.all_students.each do |student|
    puts "#{student.name} #{student.surname}, Возраст: #{student.calculate_age}"
end
