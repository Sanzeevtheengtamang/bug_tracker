class Bug < ApplicationRecord
    enum status: [:solved,:unsolved,:handling,:ignored]
    belongs_to :project
    belongs_to :user
    
    acts_as_commontable

end



