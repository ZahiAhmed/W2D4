require "byebug"
puts

class String 
    def select (&prc)
        return "" if prc == nil
        new_string = ""
        self.each_char{|char|new_string << char if prc.call(char)}
        new_string
    end

    def map!(&prc)
        self.each_char.with_index {|char, i| self[i] = prc.call(char)}
    end
end

# Examples select
    puts "select"
    puts "===================================="
    p"app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
    p"HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
    p"HELLOworld".select          # => ""
puts

# Examples map!
    puts "map!"
    puts "===================================="
    word_1 = "Lovelace"
    word_1.map! do |ch| 
        if ch == 'e'
            '3'
        elsif ch == 'a'
            '4'
        else
            ch
        end
    end
    p word_1        # => "Lov3l4c3"
puts
