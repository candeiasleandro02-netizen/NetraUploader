CREATE TABLE IF NOT EXISTS users (
  id INTEGER PRIMARY KEY,
  lang TEXT,
  is_banned INTEGER DEFAULT 0,
  joined_at INTEGER
);

CREATE TABLE IF NOT EXISTS files (
  code TEXT PRIMARY KEY,
  channel_msg_id INTEGER,
  file_type TEXT,
  file_name TEXT,
  file_size INTEGER,
  caption TEXT,
  uploader_id INTEGER,
  created_at INTEGER,
  downloads INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS config (
  key TEXT PRIMARY KEY,
  value TEXT
);

CREATE TABLE IF NOT EXISTS stats (
  key TEXT PRIMARY KEY,
  value INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS admin_state (
  user_id INTEGER PRIMARY KEY,
  state TEXT,
  updated_at INTEGER
);

CREATE TABLE IF NOT EXISTS rate_limit (
  user_id INTEGER PRIMARY KEY,
  last_ts INTEGER
);

CREATE TABLE IF NOT EXISTS pending_download (
  user_id INTEGER PRIMARY KEY,
  code TEXT,
  expires_at INTEGER
);
