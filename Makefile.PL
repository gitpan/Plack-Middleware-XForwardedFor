
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Plack middleware to handle X-Forwarded-For headers',
  'AUTHOR' => 'Graham Barr',
  'BUILD_REQUIRES' => {},
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Plack-Middleware-XForwardedFor',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Plack::Middleware::XForwardedFor',
  'PREREQ_PM' => {
    'Net::Netmask' => '1.9015',
    'Plack' => '0.9913',
    'Regexp::Common' => '2010010201',
    'parent' => '0.223'
  },
  'VERSION' => '0.103060',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



