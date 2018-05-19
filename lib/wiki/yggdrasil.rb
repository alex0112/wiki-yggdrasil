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
          article_children.each_with_object({}) do |uri, tree|
            if (depth == 0)
              tree[uri] = Wiki::Yggdrasil::Article.new(uri: uri)
            else
              article       = Wiki::Yggdrasil::Article.new(uri: uri)
              tree[article] = get_children.call(depth - 1, article.child_links)
            end
          end
        end    

        @children ||= get_children.call(depth, article_children)
      end

    end
  end
end
