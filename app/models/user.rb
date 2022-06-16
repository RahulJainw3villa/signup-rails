class User < ApplicationRecord
    validates :name, presence: true
    validates :mobile, presence: true,numericality: true,length: {minimum:5, maximum: 10}
    validates :city, presence: true ,length: {minimum:3, maximum: 30}
    validates :password, presence: true 
    validates :confirmPassword, presence: true

    before_create :same_password 

    def same_password
        if(password == confirmPassword)
            puts "correct password"
        else
            render :edit, status: :unprocessable_entity
        end
    end


end
