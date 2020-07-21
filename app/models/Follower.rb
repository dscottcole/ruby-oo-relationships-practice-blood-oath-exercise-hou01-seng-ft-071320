class Follower
    attr_accessor :name, :age, :life_motto


    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
    end

    def cults
        a = BloodOath.all.find_all {|oaths| oaths.follower == self}
        a.map {|oaths| oaths.cult}
    end

    def join_cult(cult, initiation_date = Time.now.strftime("%Y/%m/%d"))
        BloodOath.new(cult, self, initiation_date)
    end

    def self.all
        BloodOath.all.map {|oaths| oaths.follower}
    end

    def self.of_a_certain_age(age)
        binding.pry
        BloodOath.all.select {|oaths| oaths.follower.age >= age}    
    end

end