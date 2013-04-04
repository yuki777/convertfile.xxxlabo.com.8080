#!/usr/bin/ruby
# -*- coding: utf-8 -*-

PWD = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.push(PWD)

# libs
require "rubygems"
require "bundler/setup"
require 'sinatra'
require 'logger'
require 'dropbox_sdk'
require 'mysql2'
require 'mysql2-cs-bind'
require 'base64'

# logger
$LOG = Logger.new(PWD + "/logs/app.log")

# my libs
require 'define'
require 'functions/dropbox'
require 'functions/mysql'
require 'functions/mysql-users'

# my apps
require "apps/init"
require "apps/index"
require "apps/login"
require "apps/logout"
require "apps/home"
require "apps/create"
require "apps/read"
require "apps/update"
require "apps/delete"
require "apps/delta" 
require "apps/urlecho"

