-- Script SQL pour Supabase - Aladine Atelier
-- À exécuter dans l'éditeur SQL de Supabase

CREATE TABLE IF NOT EXISTS site_config (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    key TEXT NOT NULL UNIQUE,
    value JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS images (
    id TEXT PRIMARY KEY,
    url TEXT NOT NULL,
    alt TEXT,
    "order" INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS navigation_items (
    id TEXT PRIMARY KEY,
    text TEXT NOT NULL,
    url TEXT NOT NULL,
    "order" INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS buttons (
    id TEXT PRIMARY KEY,
    text TEXT NOT NULL,
    url TEXT,
    color TEXT NOT NULL,
    "left" INTEGER NOT NULL,
    top INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Activer RLS (Row Level Security)
ALTER TABLE site_config ENABLE ROW LEVEL SECURITY;
ALTER TABLE images ENABLE ROW LEVEL SECURITY;
ALTER TABLE navigation_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE buttons ENABLE ROW LEVEL SECURITY;

-- Politiques pour permettre l'accès public en lecture/écriture
CREATE POLICY "Allow public read access" ON site_config FOR SELECT USING (true);
CREATE POLICY "Allow public write access" ON site_config FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow public update access" ON site_config FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "Allow public delete access" ON site_config FOR DELETE USING (true);

CREATE POLICY "Allow public read access" ON images FOR SELECT USING (true);
CREATE POLICY "Allow public write access" ON images FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow public update access" ON images FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "Allow public delete access" ON images FOR DELETE USING (true);

CREATE POLICY "Allow public read access" ON navigation_items FOR SELECT USING (true);
CREATE POLICY "Allow public write access" ON navigation_items FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow public update access" ON navigation_items FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "Allow public delete access" ON navigation_items FOR DELETE USING (true);

CREATE POLICY "Allow public read access" ON buttons FOR SELECT USING (true);
CREATE POLICY "Allow public write access" ON buttons FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow public update access" ON buttons FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "Allow public delete access" ON buttons FOR DELETE USING (true);