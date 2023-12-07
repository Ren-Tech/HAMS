<?php

use models\Classes;

class ClassesService
{
    public $collection_name = "classes";
    private $firestore;
    private $cofig;
    public function __construct()
    {
        $this->cofig = new FirebaseConfig();
        $this->firestore = $this->cofig->getFirestore()->database();
    }

    public function createClasses(Classes $classes): void
    {
        $data = [
            'id' => $classes->id,
            'image' => $classes->image,
            'name' => $classes->name,
            'schoolYear' => $classes->schoolYear,
            'educationLevel' => $classes->educationLevel,
            'curriculum' => $classes->curriculum,
            'semester' => $classes->semester,
            'available' => $classes->available,
        ];

        if ($classes->createdAt !== null) {

            $data['createdAt'] = is_string($classes->createdAt) ? new DateTime($classes->createdAt) : $classes->createdAt;
        }

        $this->firestore->collection('classes')->document($classes->id)->set($data);
    }

    public function getClassesById(string $classesId): ?Classes
    {
        $snapshot = $this->firestore->collection('classes')->document($classesId)->snapshot();

        if (!$snapshot->exists()) {
            return null;
        }

        $data = $snapshot->data();
        return $this->mapDataToClasses($data);
    }

    private function mapDataToClasses(array $data): Classes
    {
        // Implement mapping logic based on your data structure
        $classes = new Classes();
        $classes->id = $data['id'];
        $classes->image = $data['image'];
        $classes->name = $data['name'];
        $classes->schoolYear = $data['schoolYear'];
        $classes->educationLevel = $data['educationLevel'];
        $classes->curriculum = $data['curriculum'];
        $classes->semester = $data['semester'];
        $classes->available = $data['available'];
        $classes->createdAt = $data['createdAt'] ? new DateTime($data['createdAt']->get()->format('Y-m-d H:i:s')) : null;

        return $classes;
    }

}