<?php

use Kreait\Firebase\Auth\SignInResult;
use Kreait\Firebase\Exception\AuthException;
use Kreait\Firebase\Exception\FirebaseException;

require __DIR__.'/firebase-config.php';

class AuthService
{

    private $auth;
    private $cofig;

    public function __construct()
    {
        $this->cofig = new FirebaseConfig();
        $this->auth = $this->cofig->getAuth();
    }

    public function loginUser($email, $password)
    {
        try {
            return $this->auth->signInWithEmailAndPassword($email, $password);
        } catch (\Exception $e) {
            echo 'Error: ' . $e->getMessage();
            return null;
        } catch (AuthException|FirebaseException $e) {
            // Handle other exceptions
            echo 'Error: ' . $e->getMessage();
            return  null;
        }
    }


}