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

  describe '#gig_duration' do
    it 'returns the correct interval when adding 30 minutes' do
      expect(helper.gig_duration('18-00', 'a band')).to eq('18:00-18:30')
      expect(helper.gig_duration('23-45', 'a band')).to eq('23:45-00:15')
      expect(helper.gig_duration('00-00', 'a band')).to eq('00:00-00:30')
    end

    it 'handles invalid time formats gracefully' do
      expect { helper.gig_duration('invalid', 'a band') }.to raise_error(ArgumentError)
    end

    it 'handles edge cases like 23:59 correctly' do
      expect(helper.gig_duration('23-59', 'a band')).to eq('23:59-00:29')
    end

    context 'for the DJs specified' do
      it 'displays open interval' do
        expect(helper.gig_duration('23-59', 'GOSH DJ')).to eq('23:59-')
      end
    end
  end
end
