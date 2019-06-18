require "wiki/yggdrasil/version"

module Wiki
  module Yggdrasil
    require 'wiki/article'
    
    class Yggdrasil
      attr_reader :root

      def initialize(uri:)
        @root     = Wiki::Yggdrasil::Article.new(uri: uri)
        @children = nil
      end

      def children(depth: 4, article_children: self.root.child_links)
        @children ||= { name: self.root.name, children: recursive_scrape(depth: depth), index: 0, depth: 0 }
      end

      def recursive_scrape(depth: 1, children: @root.child_links)
        children.each_with_index.map do |uri, index|
          article = Wiki::Yggdrasil::Article.new(uri: uri)
          if (depth == 1)
            {
              name: article.name,
              index: index + 1,
              level: depth,
              children: [],
            }
          else
            {
              name: article.name,
              index: index + 1,
              level: depth,
              children: recursive_scrape(depth - 1, article.child_links),
            }
          end
        end
      end
    end

  end

end
