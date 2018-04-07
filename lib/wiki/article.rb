require 'nokogiri'
require 'open-uri'
module Wiki::Yggdrasil
  class Article
    attr_reader :uri

    def initialize(uri:)
      raise ArgumentError unless Wiki::Yggdrasil::Article.is_valid_wiki_article?(uri: uri)
    end

    def self.is_valid_wiki_article?(uri:)
      ## Is this URI a wikipedia article?
      uri =~ /.*wikipedia\.org\/wiki\/.+/ ? true : false
    end

  end
end
