# require 'narray'
require 'matrix'

class Neural_netword
    attr_accessor :size, :inputs
    def initialize(size = [2, 2, 2], inputs)


        @size = size
        @inputs = inputs

        @neuron_values = Array.new(@size.length)
        @neuron_values[0] = @inputs

        @biases = create_biases(size)
        @weights = create_weights(size)
        

        p @inputs
        p @biases
        p @weights
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
    
    # def feed_forward(@neuron_values)
    #     @neuron_values.each_with_index do |x, index|

    
    # end


    def sigmoid(x)
        out = 1/(1+Math.exp(-x))
    end
    
end


network = Neural_netword.new([2, 2], [35, 0.2])

