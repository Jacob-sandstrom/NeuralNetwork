
array1 = [0,1,2,3,4,5,6,7,8,9]
array2 = ["zero","one","two","three","four","five","six","seven","eight","nine"]
array3 = [10,11,12,13,14,15,16,17,18,19]

combined_array = [array1,array2]

for x,y,z in array1.zip(array2, array3)
    p x
    p y
    p z
end


# p array1.zip(array2)



