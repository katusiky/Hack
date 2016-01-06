class Monkey

    attr_accessor :legs

    @legs = 2
    @@arms = 2

    def arms
        @@arms
    end

    def self.have
        true
    end

    def pooping
        puts "I´m pooping!"
    end

    def peeing
        puts "I´m peeing!"
    end

    private #ruby lo admite
    #protected = seria lo correcto en otros lenguajes

    def evolve
        puts "I´m evolving to HUMAN!!!"
    end
end