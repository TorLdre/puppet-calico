# == Class: calico::params
#
# Default parameter values
#
class calico::params {
  $compute_bird_template            = 'calico/compute/bird.conf.erb'
  $compute_bird6_template           = 'calico/compute/bird6.conf.erb'
  $compute_manage_dhcp_agent        = true
  $compute_manage_peers             = true
  $compute_manage_qemu_settings     = true
  $compute_metadata_service_default = 'openstack-nova-metadata-api'
  $compute_metadata_service_enable  = true
  $compute_metadata_package_default = 'openstack-nova-api'
  $compute_package_default          = 'calico-compute'
  $compute_peer_tempalte            = 'calico/compute/peer.erb'
  $compute_service_conf             = '/etc/calico/felix.conf'
  $compute_service_default          = 'calico-felix'
  $compute_service_enable           = true
  $controller_package_default       = 'calico-control'
  $controller_service_default       = 'neutron-server'
  $enable_ipv4                      = true
  $enable_ipv6                      = true
  $libvirt_service_default          = 'libvirtd'
#  $manage_packages                  = false
#  $manage_repo                      = false
#  $manage_epel                      = false
  $reflector_bird_template          = 'calico/reflector/bird.conf.erb'
  $reflector_bird6_template         = 'calico/reflector/bird6.conf.erb'
  $reflector_client_template        = 'calico/reflector/client.erb'
  $reflector_manage_clients         = true
  $router_id                        = $ipaddress
  $qemu_conf_default                = '/etc/libvirt/qemu.conf'
  case $::osfamily {
    'Debian' : {
      case $::operatingsystem {
        default: {
          $compute_metadata_service = $compute_metadata_service_default
          $compute_metadata_package = $compute_metadata_package_default
          $compute_package          = $compute_package_default
          $compute_service          = $compute_service_default
          $controller_package       = $controller_package_default
          $controller_service       = $controller_service_default
          $libvirt_service          = $libvirt_service_default
          $qemu_conf                = $qemu_conf_default
        }
      }
    }
    'RedHat' : {
      validate_re($::operatingsystemmajrelease, '^7$', 'A 7.x Red Hat based system is required.')
      $compute_metadata_service = $compute_metadata_service_default
      $compute_metadata_package = $compute_metadata_package_default
      $compute_package          = $compute_package_default
      $compute_service          = $compute_service_default
      $controller_package       = $controller_package_default
      $controller_service       = $controller_service_default
      $libvirt_service          = $libvirt_service_default
      $qemu_conf                = $qemu_conf_default
    }
    default: {
      validate_re($::osfamily, '^(Debian|RedHat)$', 'Debian or Red Hat based system required.')
    }
  }


}
