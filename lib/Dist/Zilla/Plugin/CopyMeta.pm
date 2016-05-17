package Dist::Zilla::Plugin::CopyMeta;

use Moose;
with 'Dist::Zilla::Role::BeforeRelease';

use namespace::autoclean;
use File::Copy;

has 'files' => (
    is       => 'ro',
    isa      => 'ArrayRef[Str]',
    required => 1,
);

sub mvp_multivalue_args {qw( files )}

sub before_release {
    my ($self) = @_;

    my $dir = $self->zilla->dist_basename;

    foreach (@{$self->files}) {
        copy("$dir/$_", $_) or die "Copy failed: $_\n";
    }
}

__PACKAGE__->meta->make_immutable;

1;
