RSpec.describe Api::V1::Login::Operation::Authorization do
  subject(:result) { described_class.call(request: request) }

  let(:user) { create(:user) }
  let(:payload) { { user_id: user.id } }
  let(:session) { JWTSessions::Session.new(payload: payload) }
  let(:headers) { session.login }
  let(:request) { instance_double('Request', headers: headers) }

  context 'when token is valid' do
    it 'return current user' do
      expect(result).to be_success
      expect(result[:current_user]).to eq(user)
    end
  end
end
