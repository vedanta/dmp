server {
    listen 80;
    listen [::]:80;
    root {{ salt['pillar.get']('sampleapp:documentroot') }};

    index index.php index.html index.htm index.nginx-debian.html;
    charset utf-8;

    server_name {{ salt['pillar.get']('sampleapp:servername') }};

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    access_log off;
    error_log  /var/log/nginx/error.log error;

    sendfile off;

    client_max_body_size 100m;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    # pass the PHP scripts to FastCGI server listening on UNIX socket
    #
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_intercept_errors off;
        fastcgi_buffer_size 32k;
        fastcgi_buffers 128 16k;
        fastcgi_connect_timeout 300;
        fastcgi_send_timeout 300;
        fastcgi_read_timeout 300;
    }
}

