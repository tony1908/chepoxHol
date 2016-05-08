class Nlp
	require 'rest-client'

	def initialize(url)
		@url = url
	end

	def makeRequest(data)
		intent = []
		values = []
		response = RestClient.get @url+data
		if response.code == 200
			response = JSON.parse(response)
			intent.push(response['intents'][0]['intent'])
			if response['entities'].size > 0
				response['entities'].each do |val|
					values.push(val['entity'])
				end
			end

		end
		return intent, values
	end
end 