#!/usr/bin/ruby
# -*- coding: utf-8 -*-

get '/create' do
  authed?
  client = get_client
  @now   = Time.now.strftime("%H:%M:%S")
  @text  = "this is test for create. \nat #{@now}"
  @file  = "/testfile.txt"
  client.put_file(@file, @text, true)
  erb :create
end

