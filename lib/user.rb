class User
    attr_accessor :email 
    attr_accessor :age
    @@all_users = []

    def initialize (email_def, age_def)
        @email = email_def
        @age = age_def
        @@all_users << self
    end

    def self.all
        return @@all_users
    end

    def self.find_by_email(email)
        for user in @@all_users
            if user.email == email
                return user
            end
        end
    end
end

