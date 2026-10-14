// Supabase configuration — Phaistos FAI
// Reusing the shared Supabase project (same as igatamou.gr)
// Tables are prefixed with fai_ to avoid conflicts

const SUPABASE_URL = 'https://hqabeqlvnqdvipnspjog.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhxYWJlcWx2bnFkdmlwbnNwam9nIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODU0MDQzNDMsImV4cCI6MjEwMDk4MDM0M30.nmB5WOUN-WFQRhRxS14yCLK7X5I8OqJbWk-lRtR0yDg';

const supabaseClient = supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
