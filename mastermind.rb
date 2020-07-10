class Mastermind

    attr_reader :turns
    def initialize
        @options = [1, 2, 3, 4, 5, 6, 7, 8]
        @code = []
        @code_length = 4
        @turns = 0
        puts "\nHOW TO PLAY: ___________________\n\n"
        until @code.length == @code_length do 
            random = @options.sample
            unless @code.include? random
                @code << random
            end 
        end
    end
    
    def get_user_code
        print "Turn #{@turns + 1}, Take a guess: "
        input = gets.chomp.split.map {|x| x.to_i}
        input.each do |x|
            unless @options.include? x
                until @options.include? x
                    y = x
                    print "\n#{x} is not in #{@options} \nEnter valid input for #{x}: "
                    x = gets.chomp.to_i
                    input[input.index(y)] = x
                end
            end
        end
        return input
    end

    def check_code(user_code)
        feedback_array = ["_", "_", "_", "_"]
        user_code.each do |x|
            if @code.include? x 
                if @code.index(x) == user_code.index(x)
                    feedback_array[user_code.index(x)] = "X"
                else
                    feedback_array[user_code.index(x)] = "O"
                end
            end
        end
        if @turns < 11
            @turns += 1
            if feedback_array == ["X", "X", "X", "X"]
                puts "You Guessed the right code!!!"
                return 0
            else
                p feedback_array
                return 1
            end
        else
            puts "Game Over the correct code was #{@code.to_s}"
            return 0
        end
    end

    def check_turns
        if @turns <= 12
            return 1
        end
        return 0
    end
end

try = Mastermind.new

while try.turns <= 12 do
    if try.check_code(try.get_user_code) == 0
        break
    end 
end