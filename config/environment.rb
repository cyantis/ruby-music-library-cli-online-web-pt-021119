require 'bundler'
Bundler.require

module Concerns
  module Findable
    @@all = []

    def all
      @@all
    end

    def find_by_name(name)
      all.find {|s| s.name == name}
    end

    def find_or_create_by_name(name)
      find_by_name(name) ? find_by_name(name) : create(name)
    end

    def destroy_all
      all.clear
    end
  end

  module InstanceMethods
    def initialize(name)
      @name = name
      @songs = []
    end

    def save
      self.class.all << self
    end

    def songs
      @songs
    end
  end
end

require_all 'lib'
