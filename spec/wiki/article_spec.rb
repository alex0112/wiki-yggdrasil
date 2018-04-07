describe Wiki::Yggdrasil::Article do

  before(:all) do
    @article = Wiki::Yggdrasil::Article.new(uri: 'https://en.wikipedia.org/wiki/Yggdrasil')
  end

  describe '#new' do
    context 'Given a valid wikipedia article' do
      it 'returns a Wiki::Yggdrasil::Article object' do
        expect(Wiki::Yggdrasil::Article.new(uri: 'https://en.wikipedia.org/wiki/Yggdrasil')).to be_a Wiki::Yggdrasil::Article
      end
    end

    context 'Given no uri' do
      it 'raises an ArgumentError' do
        expect { Wiki::Yggdrasil::Article.new() }.to raise_error ArgumentError
      end
    end
    
    context 'Given a non-valid wikipedia article' do
      it 'raises an argument error' do
        expect { Wiki::Yggdrasil::Article.new(uri: 'https://www.google.com/') }.to raise_error ArgumentError
      end
    end
  end

  describe '#is_valid_wiki_article?' do
    context 'Given an invalid uri' do
      it 'returns false' do
        expect(Wiki::Yggdrasil::Article.is_valid_wiki_article?(uri: 'https://www.google.com/')).to be false
      end
    end
    context 'Given a valid uri' do
      it 'returns true' do
        expect(Wiki::Yggdrasil::Article.is_valid_wiki_article?(uri: 'https://en.wikipedia.org/wiki/Yggdrasil')).to be true
      end
    end
  end
  
  xdescribe '.summary' do
    it 'only returns the summary section' do
    end
  end

  xdescribe '.summary_links' do
    it 'returns a list' do
    end

    it 'returns a list of valid wikipedia URIs' do
    end
  end
end
