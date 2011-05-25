class Dog
  def initialize(name)
    @name = name
  end

  def method_missing(name, *args, &block)
    command = /(command)_(\w+)/.match(name)
    if command
      puts "#{@name} doesn't know to #{command[2]}!"
    else
      raise "It's not a valid trick"
    end
  end

  def teach_trick(name, &block)
    meth_name = 'command_' + name.to_s
    define_singleton_method(meth_name.to_sym, &block)
  end
end

d = Dog.new('Lassie')
d.teach_trick(:dance) { "#{@name} is dancing!" }
puts d.command_dance
d.teach_trick(:poo) { "#{@name} is a smelly doggy!" }
puts d.command_poo
puts
d2=Dog.new('Fido')
puts d2.command_dance
d2.teach_trick(:laugh) { "#{@name} finds this hilarious!" }
puts d2.command_laugh
puts d.command_laugh
puts
d3=Dog.new('Stimpy')
puts d3.command_dance
puts d3.command_laugh
puts d4.sample
