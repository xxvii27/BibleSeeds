class Podcast < ActiveRecord::Base
	 validates :title, presence: true
	 validates :preacher, presence: true
	 validates :church, presence: true
	 validates :link, presence: true
end
