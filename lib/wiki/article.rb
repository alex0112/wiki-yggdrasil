require 'nokogiri'
require 'open-uri'
module Wiki::Yggdrasil
  
  class Article
    attr_reader :uri
    
    def initialize(uri:)
      raise ArgumentError unless Wiki::Yggdrasil::Article.is_valid_wiki_article?(uri: uri)
      @uri         = uri
      @summary     = nil
      @child_links = nil
    end

    def self.is_valid_wiki_article?(uri:)
      ## Is this URI a wikipedia article?
      uri =~ /.*wikipedia\.org\/wiki\/.+/ ? true : false
    end

    def summary
      @summary ||= Nokogiri::HTML(Nokogiri::HTML(open(self.uri)).to_s.split('<div id="toc" class="toc">')[0]).css('p') ## TODO: Cleanup
      return @summary
    end

    def child_links
      summary      = self.summary
      @child_links ||= summary.css('p a').map {|anchor| 'https://en.wikipedia.org' << anchor['href'] }.select {|uri| Wiki::Yggdrasil::Article.is_valid_wiki_article?(uri: uri) }
      return @child_links
    end
    
  end

end
