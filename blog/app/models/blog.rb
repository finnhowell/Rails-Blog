class Blog < ActiveRecord::Base
    has_many :articles, dependent: :destroy
    #validates :name, presence: true,
    #             length: { minimum: 1 } 
end