-- Script de mise à jour pour ajouter la configuration des onglets admin
-- À exécuter dans l'éditeur SQL de Supabase

-- Ajouter la configuration des onglets admin
INSERT INTO site_config (key, value) VALUES 
('admin_tabs', '{"tabs": ["title", "images", "navigation", "buttons"], "active": "title"}'),
('admin_config', '{"password": "aladine123", "theme": "dark", "autoSave": true}')
ON CONFLICT (key) DO UPDATE SET 
    value = EXCLUDED.value,
    updated_at = NOW();

-- Vérifier que les données ont été ajoutées
SELECT key, value FROM site_config WHERE key IN ('admin_tabs', 'admin_config');
