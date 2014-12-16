# Pragmas.
use strict;
use warnings;

# Modules.
use Map::Tube::SaintPetersburg;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Map::Tube::SaintPetersburg::VERSION, 0.02, 'Version.');
