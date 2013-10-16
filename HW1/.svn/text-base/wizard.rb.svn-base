class Wizard
  def initialize
    @metaclass = class << self; self; end
  end

  def method_missing(method_name, *args)
    raise('Unknown spell') unless self.respond_to?(method_name)
  end

  def learn(spell, &code)
    @metaclass.send(:define_method, spell, &code)
  end
end
