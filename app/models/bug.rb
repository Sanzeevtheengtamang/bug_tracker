class Bug < ApplicationRecord
    enum status: [:solved,:unsolved,:handling,:ignored]
    belongs_to :project

end
