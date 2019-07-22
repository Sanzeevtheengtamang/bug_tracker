class Project < ApplicationRecord
    attr_accessor :u_id
    acts_as_paranoid
    has_and_belongs_to_many :users
    has_many :bugs

    acts_as_paranoid
end
