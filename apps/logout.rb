#!/usr/bin/ruby
# -*- coding: utf-8 -*-

get '/logout' do
  client = get_client
  uid    = client.account_info["uid"]
  session.clear
  redirect "/"
end

