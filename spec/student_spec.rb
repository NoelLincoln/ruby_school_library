require_relative '../student'

describe Student do
  let(:classroom) { instance_double('Classroom', students: []) }

  describe '#initialize' do
    it 'creates a new student' do
      student = Student.new(15, classroom, 'John Doe')
      expect(student).to be_a(Student)
    end

    it 'sets the classroom' do
      student = Student.new(15, classroom, 'John Doe')
      expect(student.classroom).to eq(classroom)
    end

    it 'defaults to "Unknown" name if not provided' do
      student = Student.new(15, classroom)
      expect(student.name).to eq('Unknown')
    end
  end

  describe '#to_hash' do
    it 'returns a hash representation of the student' do
      student = Student.new(15, classroom, 'John Doe')
      expected_hash = {
        'type' => 'Student',
        'id' => student.id,
        'name' => 'John Doe',
        'age' => 15,
        'parent_permission' => true,
        'rentals' => []
      }
      expect(student.to_hash).to eq(expected_hash)
    end
  end

  describe '#play_hooky' do
    it 'returns a shrug emoji' do
      student = Student.new(15, classroom, 'John Doe')
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end

  describe '#classroom=' do
    it 'sets the classroom and adds the student to it' do
      student = Student.new(15, classroom, 'John Doe')
      new_classroom = instance_double('Classroom', students: [])
      student.classroom = new_classroom

      expect(student.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(student)
    end

    it 'does not add the student again if already in the classroom' do
      student = Student.new(15, classroom, 'John Doe')
      student.classroom = classroom

      expect(classroom.students).to contain_exactly(student)
    end
  end
end
