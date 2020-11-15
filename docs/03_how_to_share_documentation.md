## How to share documentation

### Usage

You can attach following instructions to the project:

1. Create file: `_docs/01_intro/how_to_share_documentation.md`

```md
---
title: Sharing documentation
category: Introduction
layout: doc
order: 199
toc: true
---

{% include instructions/how_to_share_documentation.md %}
```


### Instructions

### 1. Build project

1. Build Jekyll project:

```
$ bundle exec jekyll build
```

2. Copy/download the content of the `_site` folder.

3. You can also zip the content of `_site` folder before download:

```
$ zip -r docs.zip _site/
```


### 2. Share

The built project (the `_site` folder) is a static website.


#### 2.1 Open on the computer

Download the project on local computer, navigate to the folder and open the `index.html`.


#### 2.2 Host on VPS

1. Copy files to the `/var/www/{project-name}` folder
2. Create a new file in `/etc/nginx/sites-available/{project-name}.conf`
3. Paste following configuration and adjust: port number, path to the `/var/www/{project-name}`

        server {
          listen 4004 default_server;
          listen [::]:4004 default_server;

          root /var/www/{project-name};

          server_name _;

          location / {
            # First attempt to serve request as file, then as directory, then fall back to displaying a 404.
            try_files $uri $uri/ =404;
          }
        }

4. Add symlink

        $ ln -s /etc/nginx/sites-available/{project-name}.conf /etc/nginx/sites-enabled/


5. Test configuration

        $ nginx -t

6. Reload NGINX

        $ systemctl reload nginx


##### 2.2.1 Add basic auth

1. Verify that apache2-utils (Debian, Ubuntu) or httpd-tools (RHEL/CentOS/Oracle Linux) is installed.

2. Create credentials

        $ sudo htpasswd -c /etc/nginx/.htpasswd user1

3. Edit `/etc/nginx/sites-available/{project-name}.conf`

        location / {
          auth_basic           "Private Property";
          auth_basic_user_file /etc/nginx/.htpasswd;
        }

4. Test configuration and reload nginx

        $ nginx -t
        $ systemctl reload nginx


#### 2.3 Host on the AWS S3

1. Create new bucket
2. Upload files
3. Set up ACL, permissions, CORS
4. Set up S3 bucket as hosting
