require 'bundler'
Bundler.require

module Concerns

  module Findable

    def find_by_name(name)
      self.all.each{|thing| return thing if thing.name == name}
      return nil
    end

    def find_or_create_by_name(name)
      return self.find_by_name(name) unless self.find_by_name(name) == nil
      return self.create(name)
    end

  end

end

require_all 'lib'
