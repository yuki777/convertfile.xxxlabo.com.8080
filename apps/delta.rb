#!/usr/bin/ruby
# -*- coding: utf-8 -*-

get '/delta' do
  authed?
  @delta = get_delta
  erb :delta
end

