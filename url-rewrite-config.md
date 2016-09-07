# URL rewrite settings

The app uses Codeigniter, so it needs the rewrite feature for the URLs and the configuration is different for Apache and Lighty. 

These are the settings for the local environment.

## Apache

The rewrite configuration for Apache is placed in a HT file under the document root of the site.

The content for the `.htaccess` file is:

~~~
<IfModule rewrite_module>
	RewriteBase /
	RewriteEngine on
	RewriteCond %{REQUEST_FILENAME} !-f
	RewriteCond %{REQUEST_FILENAME} !-d
	RewriteRule ^(.*)$ /index.php/$1 [L]
</IfModule>
<IfModule deflate_module>
	AddOutputFilterByType DEFLATE text/html text/plain text/xml text/css text/javascript application/javascript application/x-javascript
</IfModule>
~~~


## Lighty (lighttpd)

The configuration is:

~~~
$HTTP["host"] == "pichometro.local" {
	# redirect ONLY if requested file does not exist
	url.rewrite-if-not-file = ( "^/(.*)" => "/index.php/$1" )
}
~~~

## CI App configuration

Once the server configuration is done, open the `config.php` file in `application/config` and change the `index_page` setting to an empty string:

~~~
/*
|--------------------------------------------------------------------------
| Index File
|--------------------------------------------------------------------------
|
| Typically this will be your index.php file, unless you've renamed it to
| something else. If you are using mod_rewrite to remove the page set this
| variable so that it is blank.
|
*/
$config['index_page'] = '';
~~~