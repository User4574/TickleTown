oo::class create town {
  constructor {} {
    my variable power foods buildings
    set power 0
    set foods {}
    set buildings {}
  }

  method status {} {
    my variable power foods buildings
    set houses [lmap b $buildings {
      expr {[$b is house] ? $b : [continue]}
    }]
    set popn 0
    foreach h $houses {incr popn [$h occupancy]}
    return "Town power: $power, food: [llength $foods], houses: [llength $houses], popn: $popn/[expr [llength $houses] * 4]"
  }

  method update {} {
    my variable power buildings
    set power [expr max($power - 2, 0)]
    foreach b $buildings {$b update [self]}
  }

  method crank {} {
    my variable power
    incr power 10
    puts "You turn the crank awhile, the lights flicker."
  }

  method takefood {} {
    my variable foods
    if [expr [llength $foods] > 0] {
      set choice [expr int(rand() * [llength $foods])]
      set food [lindex $foods $choice]
      set foods [lreplace $foods $choice $choice]
      puts "You take [$food title] from the town's food supply."
      return $food
    }
  }

  method putfood {food} {
    my variable foods
    puts "You add [$food title] to the town's food supply."
    lappend foods $food
  }

  method build {what} {
    my variable buildings

    switch $what {
      house {lappend buildings [house new]}
    }
  }
}

oo::class create building {
  method is {{what {}}} {
    my variable type
    if {$what != {}} {
      return [expr {$type == $what}]
    } else {
      return $type
    }
  }
}

oo::class create house {
  superclass building

  constructor {} {
    my variable type occupants
    set type house
    set occupants 0
    puts "You put up a wooden cabin."
  }

  method occupancy {} {
    my variable occupants
    return $occupants
  }

  method update {town} {
    my variable occupants
    if {$occupants < 4 && [expr int(rand() * 6) == 0]} {
      incr occupants
    }
  }
}
