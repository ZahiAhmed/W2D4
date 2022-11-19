# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    mults_1 = findmultiples(num_1, num_2)
    mults_2 = findmultiples(num_2, num_1)
    mults_2.each{|ele| return ele if mults_1.include?(ele)}
end

def findmultiples(num_1,num_2)
    (1..num_2).map{|i| num_1 * i}
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    count = Hash.new(0)
    max = 0
    most = ""
    bigrams(str).each do |bigram| 
        count[bigram] += 1
        if count[bigram] > max
            max = count[bigram]
            most = bigram
        end
    end
    most
end

def bigrams(str)
    chars = str.split.join
    new_bigrams = []
    i = 1
    while i < chars.length
        bigram = chars[i-1] + chars[i]
        new_bigrams << bigram
        i+=1
    end
    new_bigrams
end

class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        hash = {}
        self.each{|k,v| hash[v] = k}
        hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each.with_index do |ele1, i|
            self.each.with_index do |ele2, j|
                if i < j
                    count += 1 if ele1 + ele2 == num
                end
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        sorted = false
        prc = Proc.new {|k , v| k <=> v} if prc == nil
           
        while !sorted
            sorted = true

            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i+1]) == 1
                    self[i] , self[i+1] = self[i+1] , self[i]
                    sorted = false
                end
            end
        end
        self
    end
end
