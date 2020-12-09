RSpec.describe Api::V1::Project::Contract::Default do
  subject(:project) { described_class.new(Project.new) }

  describe 'validation' do
    context 'when params is valid' do
      let(:params) { attributes_for(:project) }

      it { expect(project.validate(params)).to be_truthy }
    end

    context 'when title is empty' do
      let(:params) { attributes_for(:project, title: '') }

      it { expect(project.validate(params)).to be_falsy }
    end

    context 'when title is too short' do
      let(:params) { attributes_for(:project, title: 'Ky') }

      it { expect(project.validate(params)).to be_falsy }
    end
  end
end
