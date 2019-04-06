# Function with no param
def hi
  puts('hi')
end

hi

# Function with param
def say_hi_to(name)
  puts("Oh hi #{name}")
end

say_hi_to('Mark')

# Function with default param
def say_hi(name = 'Whatever')
  puts("hi #{name}")
end

say_hi
say_hi('Mark')