class ApiController < ApplicationController
	# require 'rest-client'

	def botReq
		val = params[:texto]
		client = HODClient.new("") 
		s = client.post('identifylanguage',{:text=>val})
		len = (s.response.body["language_iso639_2b"] != "UND") ? s.response.body["language_iso639_2b"] : "SPA"
		puts len
		r = client.post('analyzesentiment', {:text=>val, :language=>len.downcase})
		puts r.response.body["aggregate"]["sentiment"]
		render json: {"data": r.response.body["aggregate"]["sentiment"]}
	end
end
