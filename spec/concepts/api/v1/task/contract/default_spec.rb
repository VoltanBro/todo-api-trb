RSpec.describe Api::V1::Task::Contract::Default do
  subject(:task) { described_class.new(Task.new) }

  describe 'validation' do
    context 'when params is valid' do
      let(:params) { attributes_for(:task) }

      it { expect(task.validate(params)).to be_truthy }
    end

    context 'when name is empty' do
      let(:params) { attributes_for(:task, name: '') }

      it { expect(task.validate(params)).to be_falsy }
    end
  end
end
