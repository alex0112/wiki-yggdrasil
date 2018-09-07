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
        get_children = lambda do |depth, article_children|
          article_children.map do |uri|
            article = Wiki::Yggdrasil::Article.new(uri: uri)
            if (depth == 1)
              {
                name: article.name,
                children: [],
              }
            else
              {
                name: article.name,
                children: get_children.call(depth - 1, article.child_links),
              }
            end
          end
        end
        
        @children ||= [ name: self.root.name, children: get_children.call(depth, article_children) ]
      end

    end
  end
end
