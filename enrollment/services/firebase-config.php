<?php

require __DIR__.'/../vendor/autoload.php';
use Kreait\Firebase\Factory;

class FirebaseConfig {
    private $factory;

    public function __construct() {
        $serviceAccountPath = __DIR__ . '/admin.json'; // Adjust the path accordingly
        $this->factory = (new Factory)
            ->withServiceAccount($serviceAccountPath)
            ->withDatabaseUri('https://hams-50519.firebaseio.com');
    }

    public function getAuth() {
        return $this->factory->createAuth();
    }

    public function getFirestore() {
        return $this->factory->createFirestore();
    }

    public function getStorage() {
        return $this->factory->createStorage();
    }
}
