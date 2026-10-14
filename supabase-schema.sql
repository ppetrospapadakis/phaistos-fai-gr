-- ================================================================
-- Φαιστός ΦΑΪ — Supabase Schema (no Supabase Auth required)
-- Run this in: https://supabase.com/dashboard/project/hqabeqlvnqdvipnspjog/sql/new
-- ================================================================

-- Drop old tables if they exist
DROP TABLE IF EXISTS fai_messages CASCADE;
DROP TABLE IF EXISTS fai_topics CASCADE;
DROP TABLE IF EXISTS fai_employees CASCADE;

-- Topics table
CREATE TABLE fai_topics (
    id               SERIAL PRIMARY KEY,
    title            TEXT NOT NULL,
    created_by_key   TEXT,              -- e.g. 'ariadni-papadaki'
    created_by_name  TEXT,              -- e.g. 'Αριάδνη Παπαδάκη'
    created_at       TIMESTAMPTZ DEFAULT NOW()
);

-- Messages table
CREATE TABLE fai_messages (
    id              SERIAL PRIMARY KEY,
    topic_id        INTEGER REFERENCES fai_topics(id) ON DELETE CASCADE,
    employee_key    TEXT,              -- e.g. 'petros-papadakis'
    employee_name   TEXT,              -- e.g. 'Πέτρος Παπαδάκης'
    employee_role   TEXT,              -- e.g. 'Μικρό Αφεντικό'
    employee_photo  TEXT,              -- e.g. 'employees/petros.jpg'
    content         TEXT NOT NULL,
    created_at      TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE fai_topics   ENABLE ROW LEVEL SECURITY;
ALTER TABLE fai_messages ENABLE ROW LEVEL SECURITY;

-- Allow anon read & write (we handle auth ourselves in the frontend)
CREATE POLICY "topics_read"    ON fai_topics   FOR SELECT USING (true);
CREATE POLICY "topics_insert"  ON fai_topics   FOR INSERT WITH CHECK (true);
CREATE POLICY "messages_read"  ON fai_messages FOR SELECT USING (true);
CREATE POLICY "messages_insert" ON fai_messages FOR INSERT WITH CHECK (true);
