RSpec.describe Api::V1::Comment::Contract::Default do
  subject(:comment) { described_class.new(Comment.new) }

  describe 'validation' do
    context 'when params is valid' do
      let(:params) { attributes_for(:comment) }
      
      it { expect(comment.validate(params)).to be_truthy }
    end

    context 'when body is too short' do
      let(:params) { attributes_for(:comment, body: 'Ky') }

      it { expect(comment.validate(params)).to be_falsy }
    end
  end
end
