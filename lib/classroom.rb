class Classroom
  attr_assessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student # * adds the student to the classroom.
    student.classroom = self # * sets the classroom to the student.
  end
end
