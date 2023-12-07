<?php

namespace models;

class Curriculum
{
    public ?string $subjectID = null;
    public ?int $sem = null;
    public array $schedules = [];

    // Constructor
    public function __construct(
        ?string $subjectID = null,
        ?int $sem = null,
        array $schedules = []
    ) {
        $this->subjectID = $subjectID;
        $this->sem = $sem;
        $this->schedules = $schedules;
    }
}