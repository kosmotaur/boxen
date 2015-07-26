class people::kosmotaur::apps {
  include chrome
  include chrome::canary
  include iterm2::stable
  include iterm2::colors::solarized_dark
  package {"telegram": provider => "brewcask"}
  package {"webstorm": provider => "brewcask"}
  package {"slack": provider => "brewcask"}
  package {"skype": provider => "brewcask"}
  package {"vlc": provider => "brewcask"}
  package {"micro-snitch": provider => "brewcask"}
  package {"little-snitch": provider => "brewcask"}
  package {"dash": provider => "brewcask"}
  package {"firefox": provider => "brewcask"}
  package {"hyperdock": provider => "brewcask"}
  package {"carbon-copy-cloner": provider => "brewcask"}
  package {"alfred": provider => "brewcask"}
  package {"atom": provider => "brewcask"}
}
class people::kosmotaur::osx {
  osx::recovery_message { "marek.stasikowski@me.com": }
  include osx::global::disable_key_press_and_hold
  include osx::global::enable_keyboard_control_access
  include osx::global::enable_standard_function_keys
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click
  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::dock::disable_dashboard
  include osx::dock::dim_hidden_apps
  class { "osx::dock::icon_size":
    size => 64
  }
  class { "osx::dock::magnification":
    magnification => true,
    magnification_size => 88
  }
  include osx::universal_access::ctrl_mod_zoom
  include osx::universal_access::enable_scrollwheel_zoom
  include osx::safari::enable_developer_mode
  include osx::no_network_dsstores
  include osx::software_update
  class { "osx::global::key_repeat_delay":
    delay => 15
  }
  class { "osx::sound::interface_sound_effects":
    enable => false
  }
}
class people::kosmotaur::zsh {
  exec { "oh my zsh":
    command => 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
  }
}
class people::kosmotaur {
  include brewcask
  service {"dev.nginx":
    ensure => "stopped"
  }
  service {"dev.dnsmasq":
    ensure => "stopped"
  }
  $my_classes = [
    "people::kosmotaur::apps",
    "people::kosmotaur::osx",
    "people::kosmotaur::zsh"
  ]
  include $my_classes
}
