package Map::Tube::SaintPetersburg;

# Pragmas.
use strict;
use warnings;
use 5.006;

# Modules.
use File::Share ':all';
use Moo;
use namespace::clean;

# Version.
our $VERSION = 0.02;

# Get XML.
has xml => (
	'is' => 'ro',
	'default' => sub {
		return dist_file('Map-Tube-SaintPetersburg', 'saint_petersburg-map.xml');
	},
);

with 'Map::Tube';

1;

__END__

=encoding utf8

=head1 NAME

Map::Tube::SaintPetersburg - Interface to the Saint Petersburg Metro Map.

=head1 SYNOPSIS

 use Map::Tube::SaintPetersburg;
 my $obj = Map::Tube::SaintPetersburg->new;
 my $routes_ar = $obj->get_all_routes($from, $to);
 my $station = $obj->get_node_by_id($station_id);
 my $station = $obj->get_node_by_name($station_name);
 my $route = $obj->get_shortest_route($from, $to);
 my $metro_name = $obj->name;
 my $xml_file = $obj->xml;

=head1 DESCRIPTION

It currently provides functionality to find the shortest route between the two
given nodes.

For more information about Saint Petersburg Map, click L<here|https://en.wikipedia.org/wiki/Saint_Petersburg_Metro>.

=head1 METHODS

=over 8

=item C<new()>

 Constructor.

=item C<get_all_routes($from, $to)> [EXPERIMENTAL]

 Get all routes from station to station.
 Returns reference to array with Map::Tube::Route objects.

=item C<get_node_by_id($station_id)>

 Get station node by id.
 Returns Map::Tube::Node object.

=item C<get_node_by_name($station_name)>

 Get station node by name.
 Returns Map::Tube::Node object.

=item C<get_shortest_route($from, $to)>

 Get shortest route between $from and $to node names. Node names in $from and $to are case insensitive.
 Returns Map::Tube::Route object.

=item C<name()>

 Get metro name.
 Returns string with metro name.

=item C<xml()>

 Get XML specification of SaintPetersburg metro.
 Returns string with XML.

=back

=head1 EXAMPLE1

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Encode qw(decode_utf8 encode_utf8);
 use Map::Tube::SaintPetersburg;

 # Object.
 my $obj = Map::Tube::SaintPetersburg->new;

 # Get route.
 my $route = $obj->get_shortest_route(decode_utf8('Лесная'), decode_utf8('Озерки'));

 # Print out type.
 print "Route: ".encode_utf8($route)."\n";

 # Output:
 # Route: Лесная (Кировско-Выборгская линия), Выборгская (Кировско-Выборгская линия), Площадь Ленина (Кировско-Выборгская линия), Чернышевская (Кировско-Выборгская линия), Площадь Восстания (Кировско-Выборгская линия), Владимирская (Кировско-Выборгская линия), Пушкинская (Кировско-Выборгская линия), Технологический институт (Кировско-Выборгская линия,Московско-Петроградская линия), Сенная площадь (Московско-Петроградская линия), Невский проспект (Московско-Петроградская линия), Горьковская (Московско-Петроградская линия), Петроградская (Московско-Петроградская линия), Чёрная речка (Московско-Петроградская линия), Пионерская (Московско-Петроградская линия), Удельная (Московско-Петроградская линия), Озерки (Московско-Петроградская линия)

=head1 EXAMPLE2

 # Pragmas.
 use strict;
 use utf8;
 use warnings;

 # Modules.
 use Map::Tube::SaintPetersburg;

 # Object.
 my $obj = Map::Tube::SaintPetersburg->new;

 # Get XML file.
 my $xml_file = $obj->xml;

 # Print out XML file.
 print "XML file: $xml_file\n";

 # Output like:
 # XML file: .*/saint_petersburg-map.xml

=head1 DEPENDENCIES

L<File::Share>,
L<Map::Tube>,
L<Moo>,
L<namespace::clean>.

=head1 SEE ALSO

L<Map::Tube>,
L<Map::Tube::Barcelona>,
L<Map::Tube::Berlin>,
L<Map::Tube::Bucharest>,
L<Map::Tube::Delhi>,
L<Map::Tube::Kazan>,
L<Map::Tube::Kharkiv>,
L<Map::Tube::Kiev>,
L<Map::Tube::London>,
L<Map::Tube::Minsk>,
L<Map::Tube::Moscow>,
L<Map::Tube::NYC>,
L<Map::Tube::Samara>,
L<Map::Tube::Sofia>,
L<Map::Tube::Tokyo>,
L<Map::Tube::Warsaw>.

=head1 REPOSITORY

L<https://github.com/tupinek/Map-Tube-SaintPetersburg>

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

 © 2014 Michal Špaček
 Artistic License
 BSD 2-Clause License

=head1 VERSION

0.02

=cut
