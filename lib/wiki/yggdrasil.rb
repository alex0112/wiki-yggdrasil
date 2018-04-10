require "wiki/yggdrasil/version"

module Wiki
  module Yggdrasil
    require 'wiki/article'

    class Yggdrasil
      attr_reader :root

      def initialize(uri:)
        @root = Wiki::Yggdrasil::Article.new(uri: uri)
      end

    end

  end
end
