 # {
 #    "id": 1,
 #    "author": "ssaunier",
 #    "content": "Welcome to #general!",
 #    "created_at": "2017-09-28T19:05:00.094Z"
 #  }

json.content @messages do |message|
  json.id message.id
  json.author message.user.email.match(/[^@]*/)[0]
  json.content message.content
  json.created_at message.created_at
end
