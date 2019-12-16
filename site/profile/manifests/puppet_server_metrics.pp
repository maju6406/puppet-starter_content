# @summary This profile turns on puppet server metrics
class profile::puppet_server_metrics {

  class { 'puppet_metrics_dashboard':
    add_dashboard_examples => true,
    influxdb_database_name => ['puppet_metrics','telegraf','graphite'],
    consume_graphite       => true,
    configure_telegraf     => true,
    enable_telegraf        => true,
    master_list            => ['puppet.vm'],
    puppetdb_list          => ['puppet.vm'],
  }

  class { 'puppet_metrics_dashboard::profile::master::postgres_access':
    telegraf_host => 'puppet.vm',
  }
}
