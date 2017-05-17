#!/usr/bin/env bats

@test "With no arguments, should print help" {
  run ./crawler

  [ "${lines[0]}" = "Usage" ]
  [ "${lines[1]}" = "  $ crawler [options] <site>" ]
  [ "${lines[2]}" = "Options" ]
  [ "${lines[3]}" = "  --depth,  -d  Depth of the links searched   10" ]
  [ "${lines[4]}" = "  --list,   -l  Print a list formatted output false" ]
  [ "${lines[5]}" = "Examples" ]
  [ "${lines[6]}" = "  $ crawler -d 5 www.github.com" ]
}

@test "-h and --help should print help" {
  run ./crawler -h

  [ "${lines[0]}" = "Usage" ]
  [ "${lines[1]}" = "  $ crawler [options] <site>" ]
  [ "${lines[2]}" = "Options" ]
  [ "${lines[3]}" = "  --depth,  -d  Depth of the links searched   10" ]
  [ "${lines[4]}" = "  --list,   -l  Print a list formatted output false" ]
  [ "${lines[5]}" = "Examples" ]
  [ "${lines[6]}" = "  $ crawler -d 5 www.github.com" ]

  run ./crawler --help

  [ "${lines[0]}" = "Usage" ]
  [ "${lines[1]}" = "  $ crawler [options] <site>" ]
  [ "${lines[2]}" = "Options" ]
  [ "${lines[3]}" = "  --depth,  -d  Depth of the links searched   10" ]
  [ "${lines[4]}" = "  --list,   -l  Print a list formatted output false" ]
  [ "${lines[5]}" = "Examples" ]
  [ "${lines[6]}" = "  $ crawler -d 5 www.github.com" ]
}

@test "if wget fails, should print 'not reacheble site' error" {
  run ./crawler fakesite

  # [ "$output" = "The site fakesite content could not be reached" ]
  [ "${lines[0]}" = "The site fakesite content could not be reached" ]
}

@test "set depth option if defined" {
  run ./crawler -v -d 5
  [ "${lines[0]}" = "5" ]

  run ./crawler --verbose --depth=4
  [ "${lines[0]}" = "4" ]
}

@test "set list option if defined" {
  skip
  run ./crawler -vl -d 2
}

@test "depth default to 10 and list default to false" {
  skip
}
