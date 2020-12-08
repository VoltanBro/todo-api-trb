RSpec.describe Api::V1::SessionsController, type: :request do
  let(:user) { create(:user) }
  let(:params) { { email: user.email, password: user.password } }

  describe 'GET #create' do
    context 'when user input valid params' do
      it 'create user session' do
        post api_v1_login_path, params: params
        expect(response.status).to eq(200)
        expect(response).to match_json_schema('token')
      end
    end

    context 'when user input invalid params' do
      it 'does not create user session' do
        post api_v1_login_path, params: params[email: '']
        expect(response.status).to eq(403)
      end
    end
  end
end
