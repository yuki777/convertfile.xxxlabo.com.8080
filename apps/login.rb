#!/usr/bin/ruby
# -*- coding: utf-8 -*-

get '/login' do
  # already logged in => /home
  if session[:dropbox_session]
    dropbox_session = DropboxSession.deserialize(session[:dropbox_session])
    if dropbox_session.authorized?
      redirect "/home"
    end
  end

  # oauth_callback
  if params[:oauth_token] then
    dropbox_session = DropboxSession.deserialize(session[:dropbox_session])
    dropbox_session.get_access_token rescue redirect '/login'
    session[:dropbox_session] = dropbox_session.serialize
    uid = get_client.account_info["uid"].to_s
    redirect '/home'
  else
    # go to dropbox oauth
    dropbox_session = DropboxSession.new(APP_KEY, APP_SECRET)
    session[:dropbox_session] = dropbox_session.serialize
    redirect dropbox_session.get_authorize_url(SERVER_URL + '/login') #TODO
  end
end

