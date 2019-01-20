require 'matrix'

def sigmoid(x)
    out = 1/(1+Math.exp(-x))
end

values = Vector[Vector[3,7.5], Vector[1,2]]

biases = Vector[0.5, 2.5]
weights = Vector[ Vector[5.5,2], Vector[3,1] ]

x = weights[0].inner_product values[0]

puts x
puts ""

values = [[3,7.5], [1,2]]

biases = [0.5, 2.5]
weights = [ [5.5,2], [3,1] ]

result = []
values[0].each_with_index do |a, index|
    result[index] = a * weights[0][index]
end
dot_values_weights = result.sum

p dot_values_weights

def feedforward(input)
    result = []
    values[0].each_with_index do |a, index|
        result[index] = values[0][index] * weights[0][index]
    end
    dot_values_weights = result.sum


end