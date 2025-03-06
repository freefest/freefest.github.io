RSpec.describe CustomHelpers, type: :helper do
  let(:helper) { Class.new }
  before { helper.extend CustomHelpers }

  describe '#localized_url_for' do
    require 'i18n'
    subject(:localized_url) { helper.localized_url_for(path) }
    let(:path) { 'stylesheets/site.css' }

    context 'when locale is :hu' do
      before { allow(I18n).to receive(:locale).and_return :hu }

      it 'returns the path' do
        expect(localized_url).to eq './stylesheets/site.css'
      end
    end

    context 'when locale is not :hu' do
      before { allow(I18n).to receive(:locale).and_return :en }

      it 'returns the path for locale' do
        expect(localized_url).to eq '../stylesheets/site.css'
      end
    end
  end
end
