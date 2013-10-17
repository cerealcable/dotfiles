#!/usr/bin/python
#
# Generate Reverse DNS SQL for Power DNS
# This script will take a domainId (from PowerDNS database), subnet and content
# and will then generate a LIST of SQL commands for populating PTR records.
#

domainId = 147
rSubnet = '%s.119.210.162.in-addr.arpa'
content = '162-210-119-%s.mycallis.com'

for x in range(0,256):
    print "INSERT INTO records (domain_id, name, type, content, ttl, prio) VALUES (%s, '%s', 'PTR', '%s', 3600, 0);" % (domainId, rSubnet % x, content % x)
