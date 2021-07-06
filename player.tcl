oo::class create player {
  constructor {} {
    my variable satiation
    set satiation 100
  }

  method status {} {
    my variable satiation
    return "Satiation: $satiation"
  }

  method died {} {
    my variable satiation
    return [expr $satiation <= 0]
  }

  method update {} {
    my variable satiation
    incr satiation -2
  }

  method eat {food} {
    if {$food != ""} {
      my variable satiation
      set satiation [expr min($satiation + [$food value], 100)]
      $food eat
    } else {
      puts "The town has no food."
    }
  }

  method work {amount} {
    my variable satiation
    set satiation [expr $satiation - $amount]
    puts "You wipe the sweat from your brow."
  }
}
