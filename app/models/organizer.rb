class Organizer < ApplicationRecord

  attr_accessor :about_org, 
                :organization, 
                :fb, 
                :company_profile, 
                :company_reg, 
                :company_address, 
                :company_email, 
                :company_number
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :events
end
