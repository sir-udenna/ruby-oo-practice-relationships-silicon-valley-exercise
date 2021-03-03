class VentureCapitalist
    @@all = []
    attr_accessor :name, :total_worth
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        all.select {|object|object.total_worth > 1000000000}
    end

    def offer_contract(startup,type,investment)
        FundingRound.new(startup,self,type,investment)
    end

    def funding_rounds
        #if you use .map will return a boolean value
        FundingRound.all.select{|object|object.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map{|object|object.startup}.uniq
    end

    def biggest_investment
        funding_rounds.max_by{|object|object.investment}
    end

    def invested(domain)
        var = funding_rounds.select do |object|
            object.startup.domain == domain 
        end
        var2 = 0
        var.each do |object1|
            var2+=object1.investment 
        end
        var2
    end
end
