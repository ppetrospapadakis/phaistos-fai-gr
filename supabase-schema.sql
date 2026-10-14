-- ================================================================
-- Phaistos FAI — Supabase Database Schema
-- Tables prefixed with fai_ (shared project with igatamou.gr)
-- Run this in the Supabase SQL Editor
-- ================================================================

-- fai_employees table (links to Supabase auth users)
CREATE TABLE fai_employees (
  id         SERIAL PRIMARY KEY,
  user_id    UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  name       TEXT NOT NULL,
  surname    TEXT NOT NULL,
  role       TEXT NOT NULL,
  photo_url  TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- fai_topics table for the forum
CREATE TABLE fai_topics (
  id         SERIAL PRIMARY KEY,
  title      TEXT NOT NULL,
  created_by UUID REFERENCES auth.users(id),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- fai_messages table for forum chat
CREATE TABLE fai_messages (
  id         SERIAL PRIMARY KEY,
  topic_id   INTEGER REFERENCES fai_topics(id) ON DELETE CASCADE,
  user_id    UUID REFERENCES auth.users(id),
  content    TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ================================================================
-- Row Level Security (RLS)
-- ================================================================

ALTER TABLE fai_employees ENABLE ROW LEVEL SECURITY;
ALTER TABLE fai_topics    ENABLE ROW LEVEL SECURITY;
ALTER TABLE fai_messages  ENABLE ROW LEVEL SECURITY;

-- fai_employees: anyone can read (for public about page)
-- Only authenticated users can insert/update
CREATE POLICY "fai_employees_read"
  ON fai_employees FOR SELECT
  USING (true);

CREATE POLICY "fai_employees_insert"
  ON fai_employees FOR INSERT
  WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "fai_employees_update_own"
  ON fai_employees FOR UPDATE
  USING (auth.uid() = user_id);

-- fai_topics: only authenticated users
CREATE POLICY "fai_topics_read"
  ON fai_topics FOR SELECT
  USING (auth.uid() IS NOT NULL);

CREATE POLICY "fai_topics_insert"
  ON fai_topics FOR INSERT
  WITH CHECK (auth.uid() IS NOT NULL);

-- fai_messages: only authenticated users
CREATE POLICY "fai_messages_read"
  ON fai_messages FOR SELECT
  USING (auth.uid() IS NOT NULL);

CREATE POLICY "fai_messages_insert"
  ON fai_messages FOR INSERT
  WITH CHECK (auth.uid() IS NOT NULL);

-- ================================================================
-- Example: Insert a sample employee
-- Replace 'USER_UUID_HERE' with the actual UUID from Supabase Auth
-- ================================================================

-- INSERT INTO fai_employees (user_id, name, surname, role, photo_url)
-- VALUES (
--   'USER_UUID_HERE',
--   'Αριάδνη',
--   'Επώνυμο',
--   'Διευθύντρια Γεύσεων',
--   null
-- );
