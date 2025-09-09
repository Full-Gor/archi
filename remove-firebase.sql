-- Script pour supprimer toutes les références Firebase
-- À exécuter dans l'éditeur SQL de Supabase

-- Supprimer les configurations Firebase de la table site_config
DELETE FROM site_config WHERE key LIKE '%firebase%';

-- Mettre à jour la configuration des onglets admin pour supprimer Firebase
UPDATE site_config 
SET value = '{"tabs": ["title", "images", "navigation", "buttons"], "active": "title"}'
WHERE key = 'admin_tabs';

-- Vérifier que les données ont été mises à jour
SELECT key, value FROM site_config WHERE key = 'admin_tabs';
