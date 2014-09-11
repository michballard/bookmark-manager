class Link

	include DataMapper::Resource

	has n, :tags, :through => Resource

	property :id, Serial
	property :title, String
	property :url, String

	# before :save do 
	# 	unless self.url[0..7] == "http://" || "https://"
	# 		self.url = "http://" + self.url
	# 	end
	# end

end