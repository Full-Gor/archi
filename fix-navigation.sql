-- Script pour corriger la navigation
-- À exécuter dans l'éditeur SQL de Supabase

-- Vérifier que les données de navigation existent
SELECT * FROM navigation_items ORDER BY "order";

-- Si la table est vide, insérer les données par défaut
INSERT INTO navigation_items (id, text, url, "order") VALUES 
('nav1', 'Aladine', 'pages/aladine.html', 0),
('nav2', 'Atelier', 'pages/atelier.html', 1),
('nav3', 'Projets', 'pages/projets.html', 2),
('nav4', 'Contact', 'pages/contact.html', 3),
('nav5', 'Nous rejoindre', 'pages/rejoindre.html', 4),
('nav6', 'Rechercher', 'pages/recherche.html', 5)
ON CONFLICT (id) DO NOTHING;

-- Vérifier que les données ont été ajoutées
SELECT * FROM navigation_items ORDER BY "order";
