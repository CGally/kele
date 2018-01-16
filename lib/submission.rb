module Submission
	def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)
		response = self.class.post('/checkpoint_submissions', headers: { "authorization" => @auth_token }, body: { checkpoint_id: checkpoint_id, assignment_branch: assignment_branch, assignment_commit_link: assignment_commit_link, comment: comment, enrollment_id: 35929 })
	end

  def edit_submission(id, checkpoint_id, assignment_branch, assignment_commit_link, comment)
    response = self.class.put("/checkpoint_submissions/#{id}", headers: { "authorization" => @auth_token }, body: { checkpoint_id: checkpoint_id, assignment_branch: assignment_branch, assignment_commit_link: assignment_commit_link, comment: comment, enrollment_id: 35929 })
  end
end
