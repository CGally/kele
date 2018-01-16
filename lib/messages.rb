module Messages
  def get_messages(page = nil)
    if page.nil?
      response = self.class.get('/message_threads', headers: { "authorization" => @auth_token })
    else
      response = self.class.get('/message_threads', headers: { "authorization" => @auth_token }, body: { page: page })
    end

    JSON.parse(response.body)
  end

  def create_message(sender, recipient_id, subject, stripped_text)
    self.class.post('/messages', headers: { "authorization" => @auth_token }, body: { sender: sender, recipient_id: recipient_id, subject: subject, "stripped-text": stripped_text })
  end
end
