#!/usr/bin/ruby
# -*- coding: utf-8 -*-

get '/read' do
  authed?
  client = get_client

  begin
    # 実行する処理
    @file = "/testfile.txt"
    @body = client.get_file(@file) # TODO : 存在確認
  rescue => e
    # 例外が発生したときの処理
    $LOG.debug(__FILE__+' +'+__LINE__.to_s+' read error');
    $LOG.debug(e);
  else
    # 例外が発生しなかったときに実行される処理
  ensure
    # 例外の発生有無に関わらず最後に必ず実行する処理
  end
  erb :read
end

