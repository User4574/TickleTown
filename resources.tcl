oo::class create food {
  method title {} {
    my variable name
    return $name
  }

  method value {} {
    my variable satiation
    return $satiation
  }
  
  method eat {} {
    my variable consumption
    puts $consumption
  }
}

oo::class create water {
  superclass food

  constructor {} {
    my variable satiation consumption name
    set satiation 5
    set name water
    set consumption "You enjoy some fresh water."
    puts "You gather some clean water from the nearby river."
  }
}

oo::class create apples {
  superclass food

  constructor {} {
    my variable satiation consumption name
    set satiation [expr int(rand() * 5) + 8]
    set name apples
    set consumption "You enjoy a crisp, red apple."
    puts "You gather some ripe apples from the forest."
  }
}
