#!/usr/bin/ruby
# -*- coding: utf-8 -*-

def upsert_user
  return insert_user unless select_user
  update_user
end

def select_user
  return false unless db = get_db

  query = 'select * from users where uid = ?'
  uid   = @account["uid"]

  begin
    user = db.xquery(query, uid)
  rescue => e
    $LOG.debug(__FILE__+' +'+__LINE__.to_s+' select user error');
    $LOG.debug(e);
    return false
  ensure
    db.close
  end

  return false if user.count == 0
  return user
end

def insert_user
  return false unless db = get_db

  query  = 'insert into users'
  query += '(uid, email, session, created_at)'
  query += 'values(?,?,?,?)'

  uid        = @account["uid"]
  email      = @account["email"]
  session    = Base64.encode64(Marshal.dump(get_session.serialize))
  created_at = Time.now.to_s

  begin
    db.xquery(query, uid, email, session, created_at)
  rescue => e
    $LOG.debug(__FILE__+' +'+__LINE__.to_s+' insert user error');
    $LOG.debug(e);
    return false
  ensure
    db.close
  end

  return true
end

def update_user
  return false unless db = get_db

  query      = 'update users set session = ?, updated_at = ? where uid = ?'
  session    = Base64.encode64(Marshal.dump(get_session.serialize))
  updated_at = Time.now.to_s
  uid        = @account["uid"]

  begin
    db.xquery(query, session, updated_at, uid)
  rescue => e
    $LOG.debug(__FILE__+' +'+__LINE__.to_s+' update user error');
    $LOG.debug(e);
    return false
  ensure
    db.close
  end

  return true
end

