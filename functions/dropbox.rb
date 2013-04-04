#!/usr/bin/ruby
# -*- coding: utf-8 -*-

def authed?
  redirect '/login' unless session[:dropbox_session]
  dropbox_session = DropboxSession.deserialize(session[:dropbox_session])
  redirect '/login' unless dropbox_session.authorized?
end

def get_session
  if session[:dropbox_session]
    dropbox_session = DropboxSession.deserialize(session[:dropbox_session])
    if dropbox_session.authorized?
      return dropbox_session
    end
  end
  nil
end

def get_delta
    client = get_client
    delta  = client.delta
    if delta["has_more"]
      $LOG.debug(__FILE__+' +'+__LINE__.to_s+' NEED get more delta. (has_more)');
    end
    delta["entries"]
end

def get_client
  DropboxClient.new(get_session, ACCESS_TYPE)
end

