require 'httparty'
require 'json'

class Kele
	include HTTParty

	def initialize(email, password)
		response = self.class.post(base_url, body: { email: email, password: password })

		@auth_token = response['auth_token']
    p "Error invalid credentials" if @auth_token.nil?
	end

	def get_me
		response = self.class.get(user_url, headers: { "authorization" => @auth_token })
		JSON.parse(response.body)
	end

	private

	def base_url
		"https://www.bloc.io/api/v1/sessions"
	end

	def user_url
		"https://www.bloc.io/api/v1/users/me"
	end
end
