#
use strict;
use warnings;

package Gentoo::MetaEbuild::Spec::Standard::TypeBundle;

# ABSTRACT: Standard Type Extensions.

use Data::Rx::TypeBundle;
use parent 'Data::Rx::TypeBundle';

use Module::Pluggable::Object;

sub _prefix_pairs {
    return (
        'gentoo' => 'tag:gentoo.org,2011/perl/metaebuild/standard/',
    );
}

my @plugins;

sub type_plugins {
    return @plugins if @plugins;

    my $mpo = Module::Pluggable::Object->new(
        search_path => 'Gentoo::MetaEbuild::Spec::Standard::Type',
        require => 1,
    );

    return @plugins = $mpo->plugins;
}

1;


