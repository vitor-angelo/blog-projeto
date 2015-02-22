class Comment
	include Mongoid::Document
	include Mongoid::Timestamps
	belongs_to :article
	
	field :commenter, type: String
	field :body, type: String
	
	validates :commenter, presence: true
	validates :body, presence: true
end
