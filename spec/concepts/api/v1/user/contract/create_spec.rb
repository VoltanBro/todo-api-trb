RSpec.describe Api::V1::User::Contract::Create do
  subject(:user) { described_class.new(User.new) }

  describe 'validation' do
    context 'when params is valid' do
      let(:params) { attributes_for(:user) }

      it { expect(user.validate(params)).to be_truthy }
    end

    context 'when email is wrong' do
      let(:params) { attributes_for(:user, email: 'yo@ya') }

      it { expect(user.validate(params)).to be_falsy }
    end
  end
end
