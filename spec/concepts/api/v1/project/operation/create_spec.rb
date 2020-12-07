RSpec.describe Api::V1::Project::Operation::Create do
  subject(:result) { described_class.call(current_user: user, params: params) }

  let!(:user) { create(:user) }

  it 'asdasd' do
    binding.pry
  end
end
