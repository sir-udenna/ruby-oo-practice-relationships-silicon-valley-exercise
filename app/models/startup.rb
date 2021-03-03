class Startup
    @@all = []
    attr_accessor :name, :founder, :domain 

    def initialize(name, founder, domain)
        @name = name
        @founder = founder #founders name
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(new_domain, new_name)
        self.domain = new_domain
        self.name = new_name
    end

    def self.find_by_founder(founder_name)
        all.find {|object|object.founder == founder_name}
    end

    def self.domains
        all.map {|object|object.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    #-----#
    def funding_rounds
        FundingRound.all.select{|object|object.startup == self}
    end

    def num_funding_rounds
        # FundingRound.all.count {|funding_round|funding_round.startup == self}
        self.funding_rounds.size
    end
    #-----#

    def total_funds
        #all do the same thing
        # funding_rounds.inject(0){|var1,var2|var1+=var2.investment}
        funding_rounds.map{|object|object.investment}.sum
        # funding_rounds.reduce(:+)  / funding_rounds.size
    end

    def investors
        # FundingRound.all.select{|object|object.venture_capitalist == self}
        funding_rounds.map{|object|object.venture_capitalist}.uniq
        #s3.investors => [#<VentureCapitalist:0x00007fffe687e9c8 @name="Rihanna", @total_worth=200000000000>]
    end

    def big_investors
        # FundingRound.all.select{|object|object.venture_capitalist == self}
        investors.select{|object|VentureCapitalist.tres_commas_club.include?(object)}.uniq
    end
end
