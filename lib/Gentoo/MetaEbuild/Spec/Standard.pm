use strict;
use warnings;

package Gentoo::MetaEbuild::Spec::Standard;

use Moose;
extends 'Gentoo::MetaEbuild::Spec::Base';

use Gentoo::MetaEbuild::Spec::Standard::TypeBundle;

override _build__schema_creator => sub {
  my ($self) = shift;
  require Data::Rx;
  my $rx = Data::Rx->new( { type_plugins => [ 'Gentoo::MetaEbuild::Spec::Standard::TypeBundle', ], }, );
  return sub {
    $rx->make_schema(shift);
  };
};

__PACKAGE__->meta->make_immutable;
no Moose;
1;
