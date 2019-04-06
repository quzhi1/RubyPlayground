# example Greeter class
class Greeter
  def initialize(name = 'World')
    @name = name
  end

  def say_hi
    puts "Hi #{@name}!"
  end

  def say_bye
    puts "Bye #{@name}, come back soon."
  end
end

greeter = Greeter.new('Pat')
greeter.say_hi
greeter.say_bye

# no field access
# greeter.@name

puts '---------------instance_methods-------------'
puts Greeter.instance_methods.join(' ')
puts '---------------defined_methods--------------'
puts Greeter.instance_methods(false).join(' ')
puts '---------------print class--------------'
puts greeter

# find method name
puts '---------------dynamic method finding-------'
puts greeter.respond_to?('name')
puts greeter.respond_to?('say_hi')
puts greeter.respond_to?('say_bye')

# Redefine class
class Greeter
  attr_accessor :name
end

puts '---------------redefine class--------------'
puts greeter.name
puts greeter.respond_to?('name')
puts greeter.respond_to?('name=')
greeter.name = 'Betty'
pp greeter