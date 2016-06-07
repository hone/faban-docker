require 'uri'

RESULT_DIR="/home/user/results"

raise "Need to specify a URI" unless ARGV[0]
uri = URI(ARGV[0])
print "#{RESULT_DIR}/#{uri.path.sub("/", "__")}-#{Time.now.to_i}"
