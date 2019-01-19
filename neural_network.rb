# require 'narray'

class Neural_netword
    attr_accessor :size
    def initialize(size = [3, 6, 3])


        @size = size

        @biases = create_biases(size)
        @weights = create_weights(size)
        
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
    
    
    
    
end


network = Neural_netword.new([1, 2, 1, 2])
