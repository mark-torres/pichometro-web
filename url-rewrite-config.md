# URL rewrite settings

The app needs the rewrite feature for the URLs and the configuration is different for Apache and Lighty. These are the settings for the local environment.

## Apache

The rewrite configuration for Apache is placed in a HT file under the document root of the site.

The content for the `.htaccess` file is:

~~~
<IfModule rewrite_module>
RewriteBase /
RewriteEngine on
RewriteCond $1 !^(index\.php|img|libs|js|css|robots\.txt)
RewriteRule ^(.*)$ /index.php/$1 [L]
</IfModule>
<IfModule deflate_module>
AddOutputFilterByType DEFLATE text/html text/plain text/xml text/css text/javascript application/javascript application/x-javascript
</IfModule>
~~~


## Lighty (lighttpd)

The configuration for version >= 1.4.34 is:

~~~
$HTTP["host"] == "pichometro.local" {
	# REWRITE
	# if requested file is php, deny
	$HTTP["url"] =~ "^/[^?]+\.php" {
		url.access-deny = ("")
	}
	# redirect ONLY if requested file does not exist
	$HTTP["url"] !~ "^/[^?]+\.php" {
		url.rewrite-if-not-file = ( "^/(.*)" => "/index.php/$1" )
	}
}
~~~

For older versions like 1.4.33 (Ubuntu 14):

~~~
$HTTP["host"] == "myplaces.local" {
	# redirect ONLY if requested file does not exist
	url.rewrite-if-not-file = ( "^/(.*)" => "/index.php/$1" )
}
~~~