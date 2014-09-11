post '/links' do 
	url = params["url"]
	unless url.start_with?('http://')
		url = "http://" + url
	end
	title = params["title"]
	tags = params["tags"].split(" ").map do |tag|
		Tag.first_or_create(:text => tag)
	end
	Link.create(:url => url, :title => title, :tags => tags)
	redirect to('/')
end
