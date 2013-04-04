#!/usr/bin/ruby
# -*- coding: utf-8 -*-

get '/update' do
  authed?
  client = get_client
  @now   = Time.now.strftime("%H:%M:%S")
  @file  = "/testfile.txt"
  @text  = "this is test for update.\nat #{@now}"
  client.put_file(@file, @text, true)
  erb :update
end

