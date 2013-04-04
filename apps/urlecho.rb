#!/usr/bin/ruby
# -*- coding: utf-8 -*-

get '/urlecho' do
  authed?
  client = get_client

  begin
    # 実行する処理
    @file = "/testfile.txt"
    @body = client.get_file(@file)
  rescue => e
    # 例外が発生したときの処理
    $LOG.debug(__FILE__+' +'+__LINE__.to_s+' urlecho error');
    $LOG.debug(e);
  else
    # 例外が発生しなかったときに実行される処理
    @urlecho = Net::HTTP.post_form(URI.parse("http://urlecho.com/make.php"), {"text" => @body.to_s, "dump" => 1})
    @urlecho_file = @file + '.urlecho.com.wav'
    client.put_file(@urlecho_file, @urlecho.body.to_s, true)
  ensure
    # 例外の発生有無に関わらず最後に必ず実行する処理
  end
  erb :urlecho
end
