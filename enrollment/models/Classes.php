<?php

namespace models;

class Classes
{
    public ?string $id = null;
    public ?string $image = null;
    public ?string $name = null;
    public ?string $schoolYear = null;
    public ?string $educationLevel = null;
    public array $curriculum = [];
    public ?int $semester = null;
    public ?bool $available = null;
    public ?string $createdAt = null;

    // Constructor
    public function __construct(
        ?string $id = null,
        ?string $image = null,
        ?string $name = null,
        ?string $schoolYear = null,
        ?string $educationLevel = null,
        array $curriculum = [],
        ?int $semester = null,
        ?bool $available = null,
        ?string $createdAt = null
    ) {
        $this->id = $id;
        $this->image = $image;
        $this->name = $name;
        $this->schoolYear = $schoolYear;
        $this->educationLevel = $educationLevel;
        $this->curriculum = $curriculum;
        $this->semester = $semester;
        $this->available = $available;
        $this->createdAt = $createdAt;
    }
}
