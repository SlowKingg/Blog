RSpec.describe 'Posts', type: :request do
  describe 'SlowMath' do
    it 'be able to perform base math' do
      expect(2 + 2).to eq(4)
    end
  end

  describe String do
    let(:string) { '' }

    it 'be equal to an empty string' do
      expect(string).to eq('')
    end
  end
end
