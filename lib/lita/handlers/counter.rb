class Counter
    attr_reader :num
    def initialize
        @num = 0
    end
    def countes
        @num += 1
        @num = @num % 9
    end 
end

counter = Counter.new
