// Initialisation de Supabase
let supabase = null;

// Fonction d'initialisation
function initSupabase() {
    if (typeof window.supabase !== 'undefined' && !supabase) {
        try {
            const { createClient } = window.supabase;
            supabase = createClient(
                'https://uychwicukidatfvfhumb.supabase.co',
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV5Y2h3aWN1a2lkYXRmdmZodW1iIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc0MTczMzMsImV4cCI6MjA3Mjk5MzMzM30.1QSjZ1cd3w7CBKrBqKrydJygkE2lPUglKa6hg-05do4'
            );
            console.log('Supabase initialisé avec succès');
            return true;
        } catch (error) {
            console.error('Erreur initialisation Supabase:', error);
            return false;
        }
    }
    return supabase !== null;
}

// Vérifier si Supabase est disponible
function isSupabaseReady() {
    return supabase !== null;
}
// Fonctions CRUD pour site_config
async function loadSiteConfig() {
    if (!isSupabaseReady()) {
        console.warn('Supabase non initialisé');
        return null;
    }
    try {
        const { data, error } = await supabase.from('site_config').select('*');
        if (error) {
            console.error('Erreur chargement config:', error);
            return null;
        }
        
        if (!data || data.length === 0) {
            console.log('Aucune configuration trouvée');
            return null;
        }
        
        const config = {};
        data.forEach(item => {
            try {
                // Vérifier si item.value est déjà un objet ou une chaîne
                if (typeof item.value === 'string') {
                    config[item.key] = JSON.parse(item.value);
                } else {
                    config[item.key] = item.value;
                }
            } catch (parseError) {
                console.error(`Erreur parsing pour ${item.key}:`, parseError);
                config[item.key] = item.value; // Utiliser la valeur brute
            }
        });
        return config;
    } catch (err) {
        console.error('Erreur lors du chargement de la config:', err);
        return null;
    }
}

async function saveSiteConfig(key, value) {
    if (!isSupabaseReady()) {
        console.warn('Supabase non initialisé');
        return false;
    }
    try {
        const { error } = await supabase
            .from('site_config')
            .upsert({ key, value: JSON.stringify(value) }, { onConflict: 'key' });
        if (error) {
            console.error('Erreur sauvegarde config:', error);
            return false;
        }
        return true;
    } catch (err) {
        console.error('Erreur lors de la sauvegarde:', err);
        return false;
    }
}

// Fonctions CRUD pour images
async function loadImages() {
    if (!isSupabaseReady()) {
        console.warn('Supabase non initialisé');
        return [];
    }
    try {
        const { data, error } = await supabase.from('images').select('*').order('order');
        if (error) {
            console.error('Erreur chargement images:', error);
            // Si la table n'existe pas, retourner un tableau vide
            if (error.code === 'PGRST116' || error.message.includes('relation') || error.message.includes('does not exist')) {
                console.warn('Table images n\'existe pas encore. Créez les tables avec le script SQL.');
                return [];
            }
            return [];
        }
        return data || [];
    } catch (err) {
        console.error('Erreur lors du chargement des images:', err);
        return [];
    }
}

async function addImage(url, alt, order = 0) {
    if (!isSupabaseReady()) {
        console.warn('Supabase non initialisé');
        return false;
    }
    try {
        const { error } = await supabase.from('images').insert([{ id: 'img' + Date.now(), url, alt, order }]);
        if (error) {
            console.error('Erreur ajout image:', error);
            // Si la table n'existe pas, informer l'utilisateur
            if (error.code === 'PGRST116' || error.message.includes('relation') || error.message.includes('does not exist')) {
                console.warn('Table images n\'existe pas encore. Créez les tables avec le script SQL.');
            }
            return false;
        }
        return true;
    } catch (err) {
        console.error('Erreur lors de l\'ajout de l\'image:', err);
        return false;
    }
}

async function updateImage(id, url, alt) {
    if (!isSupabaseReady()) {
        console.warn('Supabase non initialisé');
        return false;
    }
    const { error } = await supabase.from('images').update({ url, alt }).eq('id', id);
    if (error) {
        console.error('Erreur mise à jour image:', error);
        return false;
    }
    return true;
}

async function deleteImage(id) {
    if (!isSupabaseReady()) {
        console.warn('Supabase non initialisé');
        return false;
    }
    const { error } = await supabase.from('images').delete().eq('id', id);
    if (error) {
        console.error('Erreur suppression image:', error);
        return false;
    }
    return true;
}

// Fonctions CRUD pour navigation
async function loadNavigationItems() {
    if (!isSupabaseReady()) {
        console.warn('Supabase non initialisé');
        return [];
    }
    const { data, error } = await supabase.from('navigation_items').select('*').order('order');
    if (error) console.error('Erreur chargement navigation:', error);
    return data || [];
}

async function addNavItem(text, url, order = 0) {
    if (!isSupabaseReady()) {
        console.warn('Supabase non initialisé');
        return false;
    }
    const { error } = await supabase.from('navigation_items').insert([{ id: 'nav' + Date.now(), text, url, order }]);
    if (error) {
        console.error('Erreur ajout navigation:', error);
        return false;
    }
    return true;
}

async function updateNavItem(id, text, url) {
    if (!isSupabaseReady()) {
        console.warn('Supabase non initialisé');
        return false;
    }
    const { error } = await supabase.from('navigation_items').update({ text, url }).eq('id', id);
    if (error) {
        console.error('Erreur mise à jour navigation:', error);
        return false;
    }
    return true;
}

async function deleteNavItem(id) {
    if (!isSupabaseReady()) {
        console.warn('Supabase non initialisé');
        return false;
    }
    const { error } = await supabase.from('navigation_items').delete().eq('id', id);
    if (error) {
        console.error('Erreur suppression navigation:', error);
        return false;
    }
    return true;
}

// Fonctions CRUD pour boutons
async function loadButtons() {
    if (!isSupabaseReady()) {
        console.warn('Supabase non initialisé');
        return [];
    }
    const { data, error } = await supabase.from('buttons').select('*').order('id');
    if (error) console.error('Erreur chargement boutons:', error);
    return data || [];
}

async function addButtonItem(text, url, color, left, top) {
    if (!isSupabaseReady()) {
        console.warn('Supabase non initialisé');
        return false;
    }
    const { error } = await supabase.from('buttons').insert([{ id: 'btn' + Date.now(), text, url, color, left, top }]);
    if (error) {
        console.error('Erreur ajout bouton:', error);
        return false;
    }
    return true;
}

async function updateButton(id, text, url, color, left, top) {
    if (!isSupabaseReady()) {
        console.warn('Supabase non initialisé');
        return false;
    }
    const { error } = await supabase.from('buttons').update({ text, url, color, left, top }).eq('id', id);
    if (error) {
        console.error('Erreur mise à jour bouton:', error);
        return false;
    }
    return true;
}

async function deleteButtonItem(id) {
    if (!isSupabaseReady()) {
        console.warn('Supabase non initialisé');
        return false;
    }
    const { error } = await supabase.from('buttons').delete().eq('id', id);
    if (error) {
        console.error('Erreur suppression bouton:', error);
        return false;
    }
    return true;
}

// Upload photo vers Storage
async function uploadPhoto(file) {
    if (!isSupabaseReady()) {
        console.warn('Supabase non initialisé');
        return null;
    }
    const fileName = `photos/${Date.now()}_${file.name}`;
    const { error } = await supabase.storage.from('images').upload(fileName, file);
    if (error) {
        console.error('Erreur upload:', error);
        return null;
    }
    const { data: { publicUrl } } = supabase.storage.from('images').getPublicUrl(fileName);
    return publicUrl;
}

// Exposer globalement
window.initSupabase = initSupabase;
window.isSupabaseReady = isSupabaseReady;
window.loadSiteConfig = loadSiteConfig;
window.saveSiteConfig = saveSiteConfig;
window.loadImages = loadImages;
window.addImage = addImage;
window.updateImage = updateImage;
window.deleteImage = deleteImage;
window.loadNavigationItems = loadNavigationItems;
window.addNavItem = addNavItem;
window.updateNavItem = updateNavItem;
window.deleteNavItem = deleteNavItem;
window.loadButtons = loadButtons;
window.addButtonItem = addButtonItem;
window.updateButton = updateButton;
window.deleteButtonItem = deleteButtonItem;
window.uploadPhoto = uploadPhoto;