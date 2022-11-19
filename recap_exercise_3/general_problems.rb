require "byebug"
puts 

def no_dupes?(arr)
    count = Hash.new(0)
    arr.each{|ele| count[ele] += 1}
    count.keys.select {|k| count[k] ==1}
end
# Examples
    puts "no_dupes?"
    puts "============================================="
    p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
    p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
    p no_dupes?([true, true, true])            # => []
puts

def no_consecutive_repeats?(arr)
    #debugger
    arr.inject do |acc, ele| 
        return false if acc == ele
        ele
    end
    true
end
# Examples
    puts "no_consecutive_repeats?"
    puts "============================================="
    p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
    p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
    p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
    p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
    p no_consecutive_repeats?(['x'])                              # => true 
puts

def char_indices(str)
    indices = Hash.new{|hash, key| hash[key] = []}
    #debugger
    str.each_char.with_index {|char, i| indices[char] << i}
    indices
end
# Examples
    puts "char_indices"
    puts "============================================="
    p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
    p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
puts

def longest_streak(str)
    current = 1
    streak = 0
    letter = ""
    longest = ""
    str.each_char.with_index do |char , i|    
        if letter != char
            letter = char
            if current > streak
                streak = current
                longest = str[i-1]
            end
            current = 0
        end   
        current += 1
    end
    longest * streak
end
# Examples
    puts "longest_streak"
    puts "============================================="
    p longest_streak('a')           # => 'a'
    p longest_streak('accccbbb')    # => 'cccc'
    p longest_streak('aaaxyyyyyzz') # => 'yyyyy
    p longest_streak('aaabbb')      # => 'bbb'
    p longest_streak('abc')         # => 'c'
puts

def bi_prime?(num)
    #debugger
    factors = (2...num).select{|factor| num % factor == 0}
    i = 0
    j = factors.length-1
    while i <= j
        return true if isPrime?(factors[i]) && isPrime?(factors[j])
        i += 1
        j -= 1
    end
    false
end
#helper
def isPrime?(n)
    return false if n < 2
    (2...n).each {|i| return false if n % i == 0}
    true
end
# Examples
    puts "bi_prime?"
    puts "============================================="
    p bi_prime?(14)   # => true
    p bi_prime?(22)   # => true
    p bi_prime?(25)   # => true
    p bi_prime?(94)   # => true
    p bi_prime?(24)   # => false
    p bi_prime?(64)   # => false
puts

def vigenere_cipher(message, keys)
    message.each_char.with_index do |char, i|
        key = keys[i % keys.length]
        message[i]=cipher(char,key)
    end
    message
end
#helper
def cipher(char, key)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    char = alphabet[(alphabet.index(char)+key) %alphabet.length]
end
# Examples
    puts "vigenere_cipher"
    puts "============================================="
    p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
    p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
    p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
    p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
    p vigenere_cipher("yawn", [5, 1])             # => "dbbo"
puts

def vowel_rotate(str)
    vowels = "aeiou"
    vowels_in_str = str.each_char.select {|char| vowels.include?(char)}
    vowel_index = 1
    vowel_count = vowels_in_str.length
    str.each_char.with_index do |char, i|
        if vowels.include?(char)
            str[i] = vowels_in_str[vowel_index % vowel_count]
            vowel_index += 1
        end
    end
    str 
end
# Examples
    puts "vowel_rotate"
    puts "============================================="
    p vowel_rotate('computer')      # => "cempotur"
    p vowel_rotate('oranges')       # => "erongas"
    p vowel_rotate('headphones')    # => "heedphanos"
    p vowel_rotate('bootcamp')      # => "baotcomp"
    p vowel_rotate('awesome')       # => "ewasemo"
puts