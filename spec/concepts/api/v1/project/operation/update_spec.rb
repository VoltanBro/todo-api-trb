RSpec.describe Api::V1::Project::Operation::Update do
  subject(:result) { described_class.call(current_user: user, params: params) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  context 'when params is valid' do
    let(:params) { { id: project.id, title: 'New Title' } }

    it 'rename project title' do
      expect(result.success?).to be(true)
      expect(result[:model].title).to eq(params[:title])
    end
  end
end
