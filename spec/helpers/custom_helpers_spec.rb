RSpec.describe CustomHelpers, type: :helper do
  let(:helper) { Class.new }
  before { helper.extend CustomHelpers }

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

  describe '#localized_url_for' do
    require 'i18n'
    let(:path) { '/memories/' }

    context 'when locale is :hu (default locale)' do
      before { allow(I18n).to receive(:locale).and_return :hu }

      it 'returns the path without locale prefix' do
        expect(helper.localized_url_for(path)).to eq('/memories/')
      end
    end

    context 'when locale is :en' do
      before { allow(I18n).to receive(:locale).and_return :en }

      it 'prefixes the path with the locale' do
        expect(helper.localized_url_for(path)).to eq('/en/memories/')
      end
    end

    context 'when path has redundant slashes' do
      before { allow(I18n).to receive(:locale).and_return :en }

      it 'cleans up extra slashes' do
        expect(helper.localized_url_for('//memories//')).to eq('/en/memories/')
      end
    end
  end
end
