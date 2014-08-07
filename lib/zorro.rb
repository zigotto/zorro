require 'bundler/setup'
require 'httparty'

require_relative "zorro/version"

module Zorro
  module Messages
    GEM_NOT_FOUND = 'Gem not found'
  end

  module Request
    include HTTParty

    base_uri 'https://rubygems.org/api/v1'
  end

  class Gem
    class NotFound < StandardError; end

    attr_accessor :name, :version

    def initialize(response)
      @name = response['name']
      @version = response['version']
    end

    def self.info(gem_name)
      url = "/gems/%s.json" % CGI.escape(gem_name)
      response = Request.get(url)

      case response.code
      when 200 then Gem.new(response)
      when 404 then raise NotFound
      end
    rescue NotFound
      Messages::GEM_NOT_FOUND
    end

    def to_gemfile
      "gem \'#{name}\', \'~> #{version}\'"
    end
  end
end
