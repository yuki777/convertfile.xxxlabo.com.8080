#!/usr/bin/ruby
# -*- coding: utf-8 -*-

# viewsが使うヘルパ関数
# <%= nl2br h @body %>
helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
  def nl2br(text)
    text.gsub(/\r\n|\r|\n/, "<br />")
  end
end

# cookie設定
#enable :sessions # => Rack
use Rack::Session::Cookie,
  :key          => 'rack.session',
  :domain       => SERVER_HOST,
  :path         => '/',
  :expire_after => 60*60*24*365*10, # 10 years
  :secret       => SESSION_SECRET
