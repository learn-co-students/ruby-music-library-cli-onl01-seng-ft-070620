module Concerns::Findable
  attr_accessor :name

  def find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def destroy_all
    self.all.clear
  end

  def create(name)
    var = self.new(name)
    var.save
    var
  end
end