class transmission (
  $transd     = $transmission::params::transd,
  $transuser  = $transmission::params::transuser,
  $transgroup = $transmission::params::transgroup,
) inherits transmission::params {
  user { $transuser:
    ensure  => present,
    home    => $transd,
    comment => 'Transmission BitTorrent',
    gid     => $transgroup,
    shell   => '/sbin/nologin',
  }
  group { $transgroup:
    ensure => present,
  }
  class { 'transmission::yum': } ->
  package { [ 'transmission','transmission-cli','transmission-common','transmission-daemon','transmission-gtk' ]:
    ensure  => installed,
    require => Yumrepo['geekery'],
  }
}
