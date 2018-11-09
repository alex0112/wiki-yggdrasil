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
  
  describe '.summary' do
    it 'is a Nokogiri document' do
      expect(@article.summary).to be_a Nokogiri::XML::NodeSet
    end
 
    it 'only returns the summary section' do
      expect(@article.summary).not_to match(/<div id="toc" class="toc">/)
    end
  end

  
  describe '.child_links' do
    it 'returns a list of valid wikipedia URIs' do
      expect(@article.child_links.all? { |link| Wiki::Yggdrasil::Article.is_valid_wiki_article?(uri: link) }).to be true
    end

    
    it 'returns an array' do
      expect(@article.child_links).to be_a Array
    end
  end

  describe '.scrape_all_summary_links' do
    let(:summary_links) { @article.scrape_all_summary_links }

    it 'returns a Nokogiri::XML::NodeSet' do
      expect(summary_links).to be_a Nokogiri::XML::NodeSet
    end

    xit 'returns the help articles when the help param is set to true' do
    end
    
    it 'is an array of valid anchor tags' do
      expect(summary_links.all? { |link| (link.to_s =~ /^<a.*<\/a>$/) }).to be true ## regex tests that all strings in the array have the form of '<a ... </a>'
    end
  end

  describe '.name' do
    it 'correctly scrapes the name "Yggdrasil" from the Yggdrasil article' do
      expect(@article.name).to eq 'Yggdrasil'
    end
  end
  
  describe '.format_links' do
    let(:nil_hrefs) { @article.scrape_all_summary_links.each_with_index {|link, i| link['href'] = nil unless i % 2 == 0 } } ## Set every other href as nil

    it 'takes an href of the form "/wiki/Article_Name and creates a valid wikipedia URI from it' do
      expect(@article.format_links.all? {|link| Wiki::Yggdrasil::Article.is_valid_wiki_article?(uri: link) } ).to be true
    end

    it 'ignores nil href values' do
      expect(@article.format_links(anchors: nil_hrefs).any?(&:nil?)).to be false
    end
  end

end

