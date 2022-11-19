require "byebug"
puts

def multiply(a, b)
    return 0 if b == 0 || a == 0
    if b < 0
        a = 0-a 
        b = 0-b   
    end
    return a if b == 1
    return a + multiply(a, b-1) 
end
# Examples
    puts "multiply"
    puts "===================================="
    p multiply(3, 5)        # => 15
    p multiply(5, 3)        # => 15
    p multiply(2, 4)        # => 8
    p multiply(0, 10)       # => 0
    #debugger
    p multiply(-3, -6)      # => 18
    p multiply(3, -6)       # => -18
    p multiply(-3, 6)       # => -18
puts

def lucas_sequence(n)
    return [] if n < 1
    return [].push(2) if n == 1
    return lucas_sequence(1).push(1) if n == 2
    return lucas_sequence(n-1).push(lucas_sequence(n-1)[n-2] + lucas_sequence(n-1)[n-3])
end
# Examples
    puts "lucas_sequence"
    puts "===================================="
    p lucas_sequence(0)   # => []
    p lucas_sequence(1)   # => [2]    
    p lucas_sequence(2)   # => [2, 1]
    p lucas_sequence(3)   # => [2, 1, 3]
    p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
    p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]
puts

def prime_factorization(num)
    return [num] if isPrime?(num)
    prime_factors = (2..num).select{|i| num % i == 0 && isPrime?(i)}
    if prime_factors.product != num
        return (prime_factors += prime_factorization(num / prime_factors.product)).sort
    end
end
#helper1
def isPrime?(n)
    return false if n < 2
    (2...n).each {|i| return false if n % i == 0}
    true
end
#helper2
class Array
    def product
        self.inject {|acc,ele| acc *ele}
    end
end
# Examples
    puts "prime_factorization"
    puts "===================================="
    p prime_factorization(12)     # => [2, 2, 3]
    p prime_factorization(24)     # => [2, 2, 2, 3]
    p prime_factorization(25)     # => [5, 5]
    p prime_factorization(60)     # => [2, 2, 3, 5]
    p prime_factorization(7)      # => [7]
    p prime_factorization(11)     # => [11]
    p prime_factorization(2017)   # => [2017]
puts

# def prime_factorization(num)
#     (2...num).each do |fact|
#         if (num % fact == 0)
#             otherFact = num / fact
#             return [ *prime_factorization(fact), *prime_factorization(otherFact) ]
#         end
#     end
#     return [num]
# end
