if Rails.env.production?
  RECIPIENTS = 'rubyreales@flordeajedrez.com,ofocas@hotmail.com,stephannordmann@yahoo.com'
  BCC_RECIPIENTS = 'dcairol@gmail.com'
else
  RECIPIENTS = 'dcairol@gmail.com'
  BCC_RECIPIENTS = 'dcairol@gmail.com'
end
