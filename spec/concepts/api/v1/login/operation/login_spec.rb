RSpec.describe Api::V1::Login::Operation::Login do
  subject(:result) { described_class.call(params: params) }

  let(:user) { create(:user) }
  let(:params) { { email: user.email, password: user.password } }

  context 'when user enters valid email and password' do
    it 'get auth token' do
      expect(result).to be_success
      expect(result[:token]).to include('access')
    end
  end

  context 'when user enters invalid email' do
    let(:params) { { email: 'foo@mail.bar', password: user.password } }

    it 'get auth token' do
      expect(result).to be_failure
      expect(result[:token]).to be_nil
    end
  end
end
