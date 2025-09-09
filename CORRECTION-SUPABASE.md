# 🔧 Correction des problèmes Supabase - Aladine Atelier

## 🚨 Problèmes identifiés et corrigés

### **1. Erreur SQL : "only WITH CHECK expression allowed for INSERT"**
- **Problème** : Les politiques RLS étaient mal configurées
- **Solution** : Script SQL simplifié sans RLS

### **2. Données non sauvegardées**
- **Problème** : Les fonctions de sauvegarde n'étaient pas correctement appelées
- **Solution** : Correction des fonctions dans `index.html`

## 📋 Instructions de correction

### **Étape 1 : Recréer les tables**

1. Allez sur https://supabase.com/dashboard
2. Ouvrez l'**éditeur SQL**
3. **Supprimez d'abord** les tables existantes :
   ```sql
   DROP TABLE IF EXISTS buttons CASCADE;
   DROP TABLE IF EXISTS navigation_items CASCADE;
   DROP TABLE IF EXISTS buttons CASCADE;
   DROP TABLE IF EXISTS site_config CASCADE;
   ```
4. **Copiez et exécutez** le contenu de `supabase-tables-simple.sql`

### **Étape 2 : Vérifier la création**

Après l'exécution, vous devriez voir :
- ✅ 4 tables créées
- ✅ Données de test insérées
- ✅ RLS désactivé (plus simple pour commencer)

### **Étape 3 : Tester la sauvegarde**

1. Ouvrez `index.html`
2. Triple-cliquez sur le titre
3. Mot de passe : `aladine123`
4. Modifiez le titre et cliquez "Sauvegarder"
5. Actualisez la page - les changements doivent persister

## 🔧 Corrections apportées

### **Fichiers modifiés :**

#### `supabase-tables-simple.sql` (NOUVEAU)
- ✅ Script simplifié sans RLS
- ✅ Suppression des tables existantes
- ✅ Données de test incluses
- ✅ Pas d'erreurs de politiques

#### `index.html`
- ✅ Fonction `saveTitle()` corrigée avec gestion d'erreurs
- ✅ Fonction `resetTitle()` corrigée
- ✅ Fonction `addImageToSite()` renommée pour éviter les conflits
- ✅ Indicateurs de synchronisation ajoutés

#### `supabase-tables.sql` (ORIGINAL)
- ✅ Politiques RLS corrigées avec `WITH CHECK`
- ✅ Syntaxe SQL mise à jour

## 🎯 Fonctionnalités maintenant opérationnelles

### **Sauvegarde automatique :**
- 🎨 **Titre** : Modifications sauvegardées en base
- 🖼️ **Images** : Ajout/suppression persistants
- 🧭 **Navigation** : Liens sauvegardés
- 🔘 **Boutons** : Configuration persistante

### **Indicateurs visuels :**
- ✅ **Succès** : Message vert de confirmation
- ❌ **Erreur** : Message rouge d'erreur
- 🔄 **Synchronisation** : Indicateur de chargement

## 🧪 Test de fonctionnement

### **Test 1 : Sauvegarde du titre**
1. Ouvrez l'administration (triple clic)
2. Modifiez le texte du titre
3. Cliquez "Sauvegarder"
4. Actualisez la page
5. ✅ Le titre modifié doit persister

### **Test 2 : Ajout d'image**
1. Dans l'onglet "Images"
2. Ajoutez une URL d'image
3. Cliquez "Ajouter Image"
4. Actualisez la page
5. ✅ L'image doit apparaître dans le slider

### **Test 3 : Navigation**
1. Dans l'onglet "Navigation"
2. Ajoutez un nouveau lien
3. Cliquez "Ajouter Lien"
4. Actualisez la page
5. ✅ Le lien doit apparaître dans la navigation

## 🚨 En cas de problème

### **Erreur "Table does not exist"**
- Exécutez le script `supabase-tables-simple.sql`

### **Erreur "Permission denied"**
- Vérifiez que RLS est désactivé dans Supabase

### **Données non sauvegardées**
- Vérifiez la console du navigateur (F12)
- Assurez-vous que Supabase est initialisé

## 📞 Support

Si les problèmes persistent :
1. Vérifiez la console du navigateur
2. Testez avec `test-supabase.html`
3. Vérifiez que les tables existent dans Supabase
4. Assurez-vous que les données de test sont présentes

---

**🎉 Votre site Aladine Atelier devrait maintenant sauvegarder correctement !**
