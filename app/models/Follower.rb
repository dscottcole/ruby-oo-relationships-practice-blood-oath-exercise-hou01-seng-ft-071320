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


    def my_cult_slogans
        binding.pry
        a = BloodOath.all.select {|oaths| oaths.follower == self}
        a.map {|oaths| p oaths.cult.slogan}
    end

    def self.most_active
        a = BloodOath.all.map {|oaths| oaths.follower.name}
        b = {}
        i = 0 
        while i < a.length do
            if b.include?(a[i]) == false
                b[a[i]] = 1
            else
                b[a[i]] +=1
            end
        i += 1
        b.find_all {|k,v| v == b.values.max}.to_h.keys
        end
    end

    # def self.top_ten
    # end

end