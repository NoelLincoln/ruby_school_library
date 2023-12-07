require_relative '../classroom'
require_relative '../student'

RSpec.describe Classroom do
  let(:classroom_label) { 'Room A' }
  let(:classroom) { Classroom.new(classroom_label) }

  describe '#initialize' do
    it 'creates a new classroom with the given label' do
      expect(classroom.label).to eq(classroom_label)
    end

    it 'initializes with an empty list of students' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      student = instance_double('Student', classroom: nil)

      allow(student).to receive(:classroom=)  # Mock the classroom= method

      expect { classroom.add_student(student) }.to change { classroom.students.size }.from(0).to(1)
      expect(classroom.students).to include(student)

      # Correct way to verify the classroom assignment
      expect(student).to have_received(:classroom=).with(classroom)
    end
  end

  describe '#remove_student' do
    it 'removes a student from the classroom' do
      student = instance_double('Student', classroom: classroom)

      allow(student).to receive(:classroom=)  # Mock the classroom= method

      # Add a student to the classroom before removing
      classroom.add_student(student)

      expect { classroom.remove_student(student) }.to change { classroom.students.size }.from(1).to(0)
      expect(classroom.students).not_to include(student)

      # verify the removal of classroom assignment
      expect(student).to have_received(:classroom=).with(nil)
    end
  end
end
