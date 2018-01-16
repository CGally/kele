require 'httparty'
require 'json'
require './lib/roadmap'
require './lib/messages'

class Kele
	include HTTParty
	include Roadmap
	include Messages
	base_uri 'https://www.bloc.io/api/v1'

	def initialize(email, password)
		response = self.class.post('/sessions', body: { email: email, password: password })

		@auth_token = response['auth_token']
    p 'Error invalid credentials' if @auth_token.nil?
	end

	def get_me
		response = self.class.get('/users/me', headers: { 'authorization' => @auth_token })
		JSON.parse(response.body)
	end

	def get_mentor_availability(mentor_id)
		response = self.class.get("/mentors/#{mentor_id}/student_availability", headers: { 'authorization' => @auth_token })
		JSON.parse(response.body).to_a
	end

	def create_submission(assignment_branch, assignment_commit_link, checkpoint_id, comment, enrollment_id)
		response = self.class.post('/checkpoint_submissions', headers: { "authorization" => @auth_token }, body: { assignment_branch: assignment_branch, assignment_commit_link: assignment_commit_link, checkpoint_id: checkpoint_id, comment: comment, enrollment_id: enrollment_id })
		JSON.parse(response.body)
	end
end
