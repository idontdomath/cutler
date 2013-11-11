cutler
======

ruby http cache cleaner library. 

Currently Supported:

* Varnish Cache (3.0)
* Cloudflare CDN.
* Akamai CCU CDN.

Akamai Example : 

	Cutler.mode = :akamai
	options = {}
	options['password'] = '8afbe6dea02407989af4dd4c97bb6e25'
	options['email'] = 'foo@bar.com'
	Cutler.options = options
	url = 'http://foobar.org/'
	Cutler.clean(url)

TODO

* Documentation (real real)
* Squid Support
* Add Akamai tests
* AWS Cloudfront
* gem wrap-up.

