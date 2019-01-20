require 'matrix'

def sigmoid(x)
    out = 1/(1+Math.exp(-x))
end

values = Matrix[[1.5,7.5], [1,2]]

biases = Vector[0.5, 2.5]
weights = Matrix[ [5.5,2], [3,1] ]

# x = weights[0, 0].inner_product values[0, 0]


print weights
