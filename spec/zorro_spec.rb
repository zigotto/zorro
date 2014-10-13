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

  context "command line" do
    context "when gem is found", vcr: { cassette_name: 'when_gem_is_found' } do
      context "and no options is given" do
        let(:output) { capture_stdout { Zorro::Gem.run('googl') }}

        it { expect(output).to include('Searching info for googl...') }
        it { expect(output).to include("gem 'googl', '~> 0.6.3'") }
      end

      context "and the --save flag is given" do
        pending
      end
    end
  end
end
