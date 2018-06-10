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

    def summary
      @summary ||= Nokogiri::HTML(Nokogiri::HTML(open(self.uri)).to_s.split('<div id="toc" class="toc">')[0]).css('p') ## TODO: Cleanup
    end

    def child_links
      all_links       = scrape_all_summary_links
      formatted_links = all_links.map { |anchor| 'https://en.wikipedia.org' << anchor['href'] }
      validated_links =  formatted_links.select { |uri| Wiki::Yggdrasil::Article.is_valid_wiki_article?(uri: uri) }
      @child_links  ||= validated_links
    end

    def scrape_all_summary_links
      self.summary.css('p a')
    end
    
    def self.is_valid_wiki_article?(uri:)
      ## Is this URI a wikipedia article?
      uri =~ /.*wikipedia\.org\/wiki\/.+/ ? true : false
    end
    

  end
end
