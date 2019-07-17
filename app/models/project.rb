class Project < ApplicationRecord
    attr_accessor :u_id
    has_and_belongs_to_many :users

end
