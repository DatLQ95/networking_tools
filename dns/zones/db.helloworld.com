;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	ns1.helloworld.com. admin.helloworld.com (
			      7		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
; name servers - NS record
@	IN	NS	ns1.helloworld.com.

_sip._udp IN SRV 2 100 5060 sip1

_sip._udp IN SRV 5 100 5060 sip2

helloworld.com IN PTR _sip._udp

; name server - A record
ns1		IN	A	10.5.1.1

; hosts
@		IN	A	10.5.1.1
sip1 	IN	A	10.5.1.1
sip2	IN	A	10.5.1.21
host1	IN	A	10.5.1.13
