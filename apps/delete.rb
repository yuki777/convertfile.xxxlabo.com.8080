#!/usr/bin/ruby
# -*- coding: utf-8 -*-

get '/delete' do
  authed?
  client = get_client
  begin
    # 実行する処理
    @file = "/testfile.txt"
    client.file_delete(@file)
  rescue => e
    # 例外が発生したときの処理
    $LOG.debug(__FILE__+' +'+__LINE__.to_s+' delete error');
    $LOG.debug(e);
  else
    # 例外が発生しなかったときに実行される処理
  ensure
    # 例外の発生有無に関わらず最後に必ず実行する処理
  end
  erb :delete
end

