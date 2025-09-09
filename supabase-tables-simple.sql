-- Script SQL simplifié pour Supabase - Aladine Atelier
-- À exécuter dans l'éditeur SQL de Supabase

-- Supprimer les tables existantes si elles existent
DROP TABLE IF EXISTS buttons CASCADE;
DROP TABLE IF EXISTS navigation_items CASCADE;
DROP TABLE IF EXISTS images CASCADE;
DROP TABLE IF EXISTS site_config CASCADE;

-- Créer les tables
CREATE TABLE site_config (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    key TEXT NOT NULL UNIQUE,
    value JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE images (
    id TEXT PRIMARY KEY,
    url TEXT NOT NULL,
    alt TEXT,
    "order" INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE navigation_items (
    id TEXT PRIMARY KEY,
    text TEXT NOT NULL,
    url TEXT NOT NULL,
    "order" INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE buttons (
    id TEXT PRIMARY KEY,
    text TEXT NOT NULL,
    url TEXT,
    color TEXT NOT NULL,
    "left" INTEGER NOT NULL,
    top INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Désactiver RLS temporairement pour simplifier
ALTER TABLE site_config DISABLE ROW LEVEL SECURITY;
ALTER TABLE images DISABLE ROW LEVEL SECURITY;
ALTER TABLE navigation_items DISABLE ROW LEVEL SECURITY;
ALTER TABLE buttons DISABLE ROW LEVEL SECURITY;

-- Insérer des données de test
INSERT INTO site_config (key, value) VALUES 
('title', '{"text": "Aladine Atelier", "font": "Arial", "size": 3, "color": "#ffffff", "left": 50, "top": 50}'),
('navigation', '{"font": "Arial", "size": 0.75, "color": "#ffffff", "hoverColor": "#d4af37"}'),
('admin_tabs', '{"tabs": ["title", "images", "navigation", "buttons"], "active": "title"}'),
('admin_config', '{"password": "aladine123", "theme": "dark", "autoSave": true}');

INSERT INTO images (id, url, alt, "order") VALUES 
('img1', 'https://images.unsplash.com/photo-1542744173-8e7e53415bb0?w=1920', 'Bureau moderne', 0),
('img2', 'https://images.unsplash.com/photo-1497366216548-37526070297c?w=1920', 'Espace de travail', 1),
('img3', 'https://images.unsplash.com/photo-1497366811353-6870744d04b2?w=1920', 'Salle de réunion', 2);

INSERT INTO navigation_items (id, text, url, "order") VALUES 
('nav1', 'Aladine', 'pages/aladine.html', 0),
('nav2', 'Atelier', 'pages/atelier.html', 1),
('nav3', 'Projets', 'pages/projets.html', 2),
('nav4', 'Contact', 'pages/contact.html', 3),
('nav5', 'Nous rejoindre', 'pages/rejoindre.html', 4),
('nav6', 'Rechercher', 'pages/recherche.html', 5);

INSERT INTO buttons (id, text, url, color, "left", top) VALUES 
('btn1', 'Action 1', '', '#d4af37', 100, 100);
