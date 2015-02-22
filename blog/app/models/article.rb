class Article
	include Mongoid::Document
	include Mongoid::Timestamps
	has_many :comments, dependent: :destroy
	
	field :title, type: String
	field :text, type: String

	validates :title, presence: true
	validates :text, presence: true, length: { minimum: 15 }
end
