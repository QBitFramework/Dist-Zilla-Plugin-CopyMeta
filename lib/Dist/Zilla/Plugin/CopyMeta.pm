package Dist::Zilla::Plugin::CopyMeta;

use Moose;
with 'Dist::Zilla::Role::BeforeRelease';

use namespace::autoclean;
use File::Copy;

sub before_release {
    my ($self) = @_;

    my $dir = $self->zilla->dist_basename;

    foreach (qw(Changes LICENSE README META.yml Makefile.PL MANIFEST)) {
        copy("$dir/$_", $_) or die "Copy failed: $!";
    }
}

__PACKAGE__->meta->make_immutable;

1;
