#!/usr/bin/ruby
# -*- coding: utf-8 -*-

get '/home' do
  authed?
  @account  = get_client.account_info
  upsert_user
  erb :home
end

