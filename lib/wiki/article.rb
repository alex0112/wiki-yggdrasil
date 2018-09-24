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
      @name        = nil
    end
    
    def summary
      @summary ||= Nokogiri::HTML(Nokogiri::HTML(open(self.uri)).to_s.split('<div id="toc" class="toc">')[0]).css('p') ## TODO: Cleanup
    end

    def child_links
      formatted_links = format_links
      validated_links =  formatted_links.select { |uri| Wiki::Yggdrasil::Article.is_valid_wiki_article?(uri: uri) }
      @child_links  ||= validated_links
    end

    def scrape_all_summary_links
      self.summary.css('p a')
    end

    def name
      @name ||= Nokogiri::HTML(open(self.uri)).css('#firstHeading').inner_html
      ## TODO: Cleanup
    end
    
    def format_links(anchors: self.scrape_all_summary_links)
      uris = anchors.map do |anchor|
        anchor.nil? || anchor['href'].nil? ? next : 'https://en.wikipedia.org' << anchor['href'] ## nil href attributes are often self refs (but possibly not always). Ignore them.
      end

      uris.compact
    end

    def self.is_valid_wiki_article?(uri:)
      ## Is this URI a wikipedia article?
      uri =~ /.*wikipedia\.org\/wiki\/.+/ ? true : false
    end
    
  end


end
