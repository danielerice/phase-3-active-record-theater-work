class Audition < ActiveRecord::Base
  belongs_to :roles

    def self.role 
       role_id = self.role_id
       Role.find_by(id: role_id)
    end

    def self.call_back
        self.update(
            hired: true
        )
    end
end