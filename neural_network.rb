# require 'narray'
require 'matrix'

class Neural_netword
    attr_accessor :size, :inputs
    def initialize(size = [2, 2, 2], inputs)


        @size = size
        @inputs = inputs

        @neuron_values = Array.new(@size.length, [])
        @neuron_values[0] = @inputs

        @biases = create_biases(size)
        @weights = create_weights(size)
        
        # p @neuron_values
        # p @inputs
        # p @biases
        # p @weights
        # print "\n"

        feed_forward
        # p @neuron_values
    end

    def create_biases(size)
        biases = []
        size[1..(size.length-1)].each do |x|
            biases << Array.new(x) {rand}
        end

        return biases
    end
    
    def create_weights(size)

        number_of_weigths = []
        size[1..(size.length-1)].each_with_index do |x, index|
            #   weights_per_neuron is simply the number of inputs a single neuron has
            weights_per_neuron = []
            x.times do |n|
                weights_per_neuron << size[index]
            end
            #   number_of_weigths is a list with size-1 elements. 
            #   number_of_weigths[0] contains a list with an integer value for each neuron in the layer after the input layer.
            #   the integer value is the weights_per_neuron
            #   number_of_weigths[1] is the layer after that and so on.
            number_of_weigths << weights_per_neuron
        end
        
        #   creates the weights according to the integer specified in number_of_weigths
        #   an integer value 2 results in an array containing 2 random integer values
        weights = []
        number_of_weigths.each do |x| 
            weight = []
            x.each do |y|
                weight << Array.new(y) {rand}
            end
            weights << weight
        end

        return weights
    end
    
    def feed_forward
        @weights.each_with_index do |x, n|
            new_values = []
            x.each_with_index do |y, i|
                result = []
                y.each_with_index do |z, j|
                    result[j] = @neuron_values[n][j] * @weights[n][i][j]
                end
                dot_product = result.sum
                dp_plus_bias = dot_product + @biases[n][i]
                new_values[i] = sigmoid(dp_plus_bias)
            end
            @neuron_values[n+1] = new_values
        end
    end


    def backprop


        
        # partial_weight_derivate = 


        # partial_bias_derivate = 
        # partial_weight_derivate = 


    end


    def sigmoid(x)
        return 1/(1+Math.exp(-x))
    end

    def derivate_sigmoid(x)
        return sigmoid(x)*(1-sigmoid(x))
    end
    
end


network = Neural_netword.new([4, 2, 3, 2], [35, 0.2, -12, -4])

