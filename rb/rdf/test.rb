
require 'linkeddata'
require 'when_exe'

Encoding.default_external = 'UTF-8'
Encoding.default_internal = 'UTF-8'

path       = ARGV[0] || 'index.csv'
datasets   = When.Resource(path)
repository = datasets.repository
puts repository[''].dump(:ttl, :prefixes=>datasets.used_ns)
