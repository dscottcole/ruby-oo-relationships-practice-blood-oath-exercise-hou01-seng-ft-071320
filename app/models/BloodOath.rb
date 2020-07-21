class BloodOath
    attr_accessor :cult, :follower, :initiation_date

    @@all = []

    def initialize(cult, follower, initiation_date)
        @cult = cult
        @follower = follower
        @initiation_date = initiation_date

        self.class.all << self
    end

    def self.all
        @@all    
    end

    def self.first_oath
        a = self.all.map {|oaths| oaths.initiation_date}
        b = a.uniq.last
        self.all.find {|oaths| oaths.initiation_date == b}
    end


end
