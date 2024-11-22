<?php
// Connexion à la base de données
$host = 'localhost';
$dbname = 'ecommerce_db'; 
$username = 'root';
$password = ''; 

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}

require 'vendor/autoload.php'; 
$faker = Faker\Factory::create();

// Fonction pour insérer des utilisateurs
function insertUtilisateurs($pdo, $faker, $count = 10) {
    for ($i = 0; $i < $count; $i++) {
        $sql = "INSERT INTO utilisateur (nom, prenom, email, mot_de_passe, telephone)
                VALUES (:nom, :prenom, :email, :mot_de_passe, :telephone)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':nom' => $faker->lastName,
            ':prenom' => $faker->firstName,
            ':email' => $faker->email,
            ':mot_de_passe' => password_hash('password123', PASSWORD_BCRYPT), // mot de passe crypté
            ':telephone' => $faker->phoneNumber,
        ]);
    }
}

// Fonction pour insérer des produits
function insertProduits($pdo, $faker, $count = 20) {
    for ($i = 0; $i < $count; $i++) {
        $sql = "INSERT INTO produit (nom_produit, description, prix, stock)
                VALUES (:nom_produit, :description, :prix, :stock)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':nom_produit' => $faker->word,
            ':description' => $faker->sentence,
            ':prix' => $faker->randomFloat(2, 5, 100),
            ':stock' => $faker->numberBetween(1, 100),
        ]);
    }
}

// Insérer des données dans les tables `panier`, `commande` et `panier_produit`
function insertPaniersEtCommandes($pdo, $faker, $utilisateurCount = 10) {
    for ($i = 1; $i <= $utilisateurCount; $i++) {
        // Création d'un panier pour chaque utilisateur
        $sqlPanier = "INSERT INTO panier (id_utilisateur) VALUES (:id_utilisateur)";
        $stmtPanier = $pdo->prepare($sqlPanier);
        $stmtPanier->execute([
            ':id_utilisateur' => $i
        ]);
        $id_panier = $pdo->lastInsertId();

        // Associer des produits au panier
        for ($j = 0; $j < $faker->numberBetween(1, 5); $j++) {
            $sqlPanierProduit = "INSERT INTO panier_produit (id_panier, id_produit, quantite)
                                 VALUES (:id_panier, :id_produit, :quantite)";
            $stmtPanierProduit = $pdo->prepare($sqlPanierProduit);
            $stmtPanierProduit->execute([
                ':id_panier' => $id_panier,
                ':id_produit' => $faker->numberBetween(1, 20),
                ':quantite' => $faker->numberBetween(1, 10),
            ]);
        }

        // Création d'une commande liée au panier
        $sqlCommande = "INSERT INTO commande (id_panier, date_commande, total_commande)
                        VALUES (:id_panier, :date_commande, :total_commande)";
        $stmtCommande = $pdo->prepare($sqlCommande);
        $stmtCommande->execute([
            ':id_panier' => $id_panier,
            ':date_commande' => $faker->date,
            ':total_commande' => $faker->randomFloat(2, 20, 500),
        ]);
    }
}

// Appeler les fonctions pour insérer les données
insertUtilisateurs($pdo, $faker, 10);
insertProduits($pdo, $faker, 20);
insertPaniersEtCommandes($pdo, $faker, 10);

echo " succès !";
?>
