require 'yaml'
require 'httparty'

require_relative "zorro/version"

module Zorro
  module Messages
    GEM_NOT_FOUND = 'Gem not found'
  end

  module Request
    include HTTParty
  end

  class Gem
    class NotFound < StandardError; end

    attr_accessor :name, :version

    def initialize(response)
      @name = response['name']
      @version = response['version']
    end

    def self.info(gem_name)
      api_url = "https://rubygems.org/api/v1/gems/%s.json" % CGI.escape(gem_name)
      response = Request.get(api_url)

      case response.code
      when 200
        Gem.new(response)
      else
        raise Gem::NotFound
      end

    rescue Gem::NotFound
      Messages::GEM_NOT_FOUND
    end

    def to_gemfile
      "gem \'#{name}\', \'~> #{version}\'"
    end
  end
end
