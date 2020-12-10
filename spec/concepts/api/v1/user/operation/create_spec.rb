RSpec.describe Api::V1::User::Operation::Create do
  subject(:result) { described_class.call(params: params) }

  let(:params) { attributes_for(:user) }

  context 'when params is valid' do
    it 'create new user' do
      expect { result }.to change(User, :count).by(1)
      expect(result).to be_success
    end
  end

  context 'when params is invalid' do
    let(:params) { attributes_for(:user, email: '') }

    it 'does not create new user' do
      expect { result }.not_to change(User, :count)
      expect(result).to be_failure
    end
  end
end
