$TTL 43200	; 12 hours
_acme-challenge.helloworld.com. IN	SOA helloworld.com. admin.helloworld.com. (
				6 ; serial
				28800      ; refresh (8 hours)
				7200       ; retry (2 hours)
				604800     ; expire (1 week)
				86400      ; minimum (1 day)
				)
			NS	helloworld.com.
			TXT	"127.0.0.1"
