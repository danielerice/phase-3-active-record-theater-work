class Role < ActiveRecord::Base
    has_many :auditions

    def self.auditions 
        id = self.id
        Audition.where(role_id: id)
    end

    def self.actors
        auditions = Auditon.where(role_id: self.id)
        name_array = []
        auditions.each { |audition| name_array << audition.name}
        name_array
    end

    def self.locations
        auditions = Auditon.where(role_id: self.id)
        location_array = []
        auditions.each { |audition| location_array << audition.location}
        location_array
    end

    def self.lead
        auditions = Auditon.where(role_id: self.id)
        lead = auditions.find_by(hired: true)

        if lead 
            return lead
        else
            return "no actor has been hired for this role"
        end

    end

    def self.understudy
        auditions = Auditon.where(role_id: self.id)
        hires = audition.where(hired: true)
        understudy = hires.2

        if understudy
            return understudy
        else 
            return 'no actor has been hired for understudy for this role'
        end
    end

end