<?php

namespace models;

class Schedule
{
    public ?string $day = null;
    public ?string $startTime = null;
    public ?string $endTime = null;

    // Constructor
    public function __construct(
        ?string $day = null,
        ?string $startTime = null,
        ?string $endTime = null
    ) {
        $this->day = $day;
        $this->startTime = $startTime;
        $this->endTime = $endTime;
    }
}