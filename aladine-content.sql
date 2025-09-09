-- Script SQL pour ajouter le contenu d'Aladine à Supabase
-- À exécuter dans l'éditeur SQL de Supabase

-- 1. Configuration générale
INSERT INTO site_config (key, value) VALUES 
('aladine_general', '{
    "logoText": "Aladine Atelier",
    "pageTitle": "Aladine",
    "profileImage": "https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=500&h=600&fit=crop",
    "profileImageAlt": "Architecte travaillant sur des plans",
    "profileImageLeft": 0,
    "profileImageTop": 0
}');

-- 2. Paragraphes de biographie
INSERT INTO bio_paragraphs (id, text, "order") VALUES 
('bio1', 'Fondateur et visionnaire derrière Aladine Atelier, Aladine Mahmoud est un architecte internationalement reconnu dont le travail transcende les conventions traditionnelles de l''architecture.', 0),
('bio2', 'Né à Beyrouth et formé à l''École Spéciale d''Architecture de Paris, Aladine a développé une approche unique qui marie l''esthétique contemporaine avec les principes durables et les influences culturelles diverses.', 1),
('bio3', 'Sa philosophie de design s''articule autour de trois principes fondamentaux : la durabilité environnementale, l''intégration culturelle et l''innovation technique. Chacun de ses projets raconte une histoire unique, créant un dialogue entre l''espace, l''environnement et les personnes qui l''habitent.', 2);

-- 3. Distinctions/Achievements
INSERT INTO achievements (id, year, "desc", "order") VALUES 
('ach1', '2023', 'Prix Pritzker d''Architecture - Nomination', 0),
('ach2', '2021', 'Médaille d''Or de l''Académie d''Architecture', 1),
('ach3', '2019', 'Grand Prix AFEX de l''Architecture Française à l''Export', 2),
('ach4', '2016', 'Prix Aga Khan d''Architecture', 3);

-- 4. Paragraphes de vision
INSERT INTO vision_paragraphs (id, text, "order") VALUES 
('vis1', '"L''architecture n''est pas simplement l''art de construire des bâtiments, c''est l''art de créer des expériences, de façonner des émotions et de laisser un impact durable sur le monde qui nous entoure. Chaque projet est une opportunité de redéfinir notre relation à l''espace et à l''environnement."', 0),
('vis2', '"Je crois fermement que l''architecture a le pouvoir de transformer positivement la vie des gens, de catalyser le changement social et de contribuer à un avenir plus durable pour notre planète."', 1);

-- 5. Configuration des styles
INSERT INTO site_config (key, value) VALUES 
('aladine_styles', '{
    "mainFont": "Arial",
    "logoFont": "Arial", 
    "titleFont": "Arial",
    "textColor": "#ffffff",
    "accentColor": "#d4af37",
    "bgColor": "#000000",
    "titleSize": 2.5,
    "subtitleSize": 1.8,
    "logoSize": 2
}');

-- 6. Configuration de navigation
INSERT INTO site_config (key, value) VALUES 
('aladine_navigation', '{
    "items": [
        {"id": "nav1", "text": "Accueil", "url": "/index.html", "active": false, "order": 0},
        {"id": "nav2", "text": "Aladine", "url": "/pages/aladine.html", "active": true, "order": 1},
        {"id": "nav3", "text": "Atelier", "url": "/pages/atelier.html", "active": false, "order": 2},
        {"id": "nav4", "text": "Projets", "url": "/pages/projets.html", "active": false, "order": 3},
        {"id": "nav5", "text": "Contact", "url": "/pages/contact.html", "active": false, "order": 4},
        {"id": "nav6", "text": "Nous rejoindre", "url": "/pages/rejoindre.html", "active": false, "order": 5},
        {"id": "nav7", "text": "Rechercher", "url": "/pages/recherche.html", "active": false, "order": 6}
    ],
    "font": "Arial",
    "size": 0.9,
    "color": "#ffffff",
    "hoverColor": "#d4af37"
}');

-- 7. Boutons personnalisés
INSERT INTO buttons (id, text, url, color, "left", top) VALUES 
('btn1', 'Contactez-nous', '/pages/contact.html', '#d4af37', 100, 100);

-- 8. Configuration des titres de sections
INSERT INTO site_config (key, value) VALUES 
('aladine_achievements_title', '"Distinctions"'),
('aladine_vision_title', '"Vision"');

-- Vérification des données insérées
SELECT 'Configuration générale' as section, key, value FROM site_config WHERE key LIKE 'aladine_%';
SELECT 'Paragraphes de biographie' as section, id, text, "order" FROM bio_paragraphs ORDER BY "order";
SELECT 'Distinctions' as section, id, year, "desc", "order" FROM achievements ORDER BY "order";
SELECT 'Paragraphes de vision' as section, id, text, "order" FROM vision_paragraphs ORDER BY "order";
SELECT 'Boutons' as section, id, text, url, color FROM buttons;
