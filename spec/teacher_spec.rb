require_relative '../person'
require_relative '../teacher'

describe Teacher do
  let(:teacher_age) { 35 }
  let(:teacher_specialization) { 'Mathematics' }
  let(:teacher_name) { 'Mr. Smith' }
  let(:parent_permission) { true }

  describe '#initialize' do
    it 'creates a new teacher with specified values' do
      teacher = described_class.new(teacher_age, teacher_specialization, teacher_name,
                                    parent_permission: parent_permission)
      expect(teacher.age).to eq(teacher_age)
      expect(teacher.name).to eq(teacher_name)
      expect(teacher.parent_permission).to be_truthy
      expect(teacher.specialization).to eq(teacher_specialization)
    end

    it 'creates a new teacher with default values' do
      teacher = described_class.new(teacher_age, teacher_specialization)
      expect(teacher.name).to eq('Unknown')
      expect(teacher.parent_permission).to be_truthy
    end
  end

  describe '#to_hash' do
    it 'returns a hash representation of the teacher' do
      teacher = described_class.new(teacher_age, teacher_specialization, teacher_name,
                                    parent_permission: parent_permission)
      expected_hash = {
        'type' => 'Teacher',
        'age' => teacher_age,
        'name' => teacher_name,
        'parent_permission' => true,
        'specialization' => teacher_specialization
      }
      expect(teacher.to_hash).to eq(expected_hash)
    end
  end
end
