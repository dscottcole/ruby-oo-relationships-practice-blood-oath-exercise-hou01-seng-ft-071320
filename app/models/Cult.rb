require 'pry'

class Cult

    attr_accessor :name, :location, :founding_year, :slogan

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan


    end

    def recruit_follower(follower, initiation_date = Time.now.strftime("%Y/%m/%d"))
        BloodOath.new(self, follower, initiation_date)
    end

    def cult_population
        BloodOath.all.select {|oaths| oaths.cult == self}.length
    end

    def self.all
        BloodOath.all.map {|oaths| oaths.cult}
    end

    def self.find_by_name (cult_name)
        a = BloodOath.all.find {|oaths| oaths.cult.name == cult_name}
        a.cult 
    end

    def self.find_by_location(location)
        b = BloodOath.all.find_all {|oaths| oaths.cult.location == location}
        b.map {|oaths| oaths.cult}
    end

    def self.find_by_founding_year(year)
        c = BloodOath.all.find_all {|oaths| oaths.cult.founding_year == year}
        d = c.map {|oaths| oaths.cult}.uniq
    end

    def average_age
        a = BloodOath.all.map {|oaths| oaths.follower.age}
        a.sum.to_f/a.length
    end

    def my_followers_mottos
       a = BloodOath.all.select {|oaths| oaths.cult == self}
       a.map {|oaths| p oaths.follower.life_motto}
    end

    def self.least_popular 
        a = BloodOath.all.map {|oaths| oaths.cult}
        b = {}
        i = 0 
        while i < a.length do
            if b.include?(a[i]) == false
                b[a[i]] = 1
            else
                b[a[i]] +=1
            end
        i += 1
        end
        b.find_all {|k,v| v == b.values.min}.to_h.keys
    end

    def self.most_common_location
        a = BloodOath.all.map {|oaths| oaths.cult.location}
        b = {}
        i = 0 
        while i < a.length do
            if b.include?(a[i]) == false
                b[a[i]] = 1
            else
                b[a[i]] +=1
            end
        i += 1
        end
        b.find_all {|k,v| v == b.values.max}.to_h.keys
    end    

end