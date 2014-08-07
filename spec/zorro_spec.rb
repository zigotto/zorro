describe Zorro::Gem do
  context "when gem is found", vcr: { cassette_name: 'when_gem_is_found' } do
    let(:search) { Zorro::Gem.info('googl') }

    it { expect(search.name).to eq('googl') }
    it { expect(search.version).to eq('0.6.3') }

    describe '#to_gemfile' do
      it { expect(search.to_gemfile).to eql("gem 'googl', '~> 0.6.3'") }
    end
  end

  context "when gem is not found", vcr: { cassette_name: 'when_gem_is_not_found' } do
    let(:search) { Zorro::Gem.info('gem_xpto_invalid') }

    it { expect(search).to eql(Zorro::Messages::GEM_NOT_FOUND) }
  end
end
