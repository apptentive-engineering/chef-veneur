default['go']['version'] = '1.7'

default['veneur']['user'] = 'dd-agent'

default['veneur']['config']['api_hostname'] = 'https://app.datadoghq.com'
default['veneur']['config']['metric_max_length'] = 4096
default['veneur']['config']['trace_max_length_bytes'] = 16384
default['veneur']['config']['flush_max_per_body'] = 10000
default['veneur']['config']['debug'] = false
default['veneur']['config']['enable_profiling'] = false
default['veneur']['config']['interval'] = '10s'
default['veneur']['config']['key'] = ''
default['veneur']['config']['num_workers'] = 96
default['veneur']['config']['num_readers'] = 1
default['veneur']['config']['percentiles'] = [0.5, 0.75, 0.9, 0.95, 0.99]
default['veneur']['config']['aggregates'] = %w(min max median avg count)
default['veneur']['config']['read_buffer_size_bytes'] = 2097152
default['veneur']['config']['forward_address'] = ''
default['veneur']['config']['stats_address'] = 'localhost:8125'
default['veneur']['config']['udp_address'] ='localhost:8126'
default['veneur']['config']['http_address'] = 'localhost:8127'
default['veneur']['config']['sentry_dsn'] = ''
default['veneur']['config']['omit_empty_hostname'] = false
