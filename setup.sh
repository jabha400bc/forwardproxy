#!/bin/bash
set -x \
&& sudo apt-get install -y apache2 apache2-doc apache2-utils \
&& sudo apt-get install -y libxml2-dev \
&& sudo a2enmod proxy proxy_ajp proxy_http rewrite deflate headers proxy_balancer proxy_connect proxy_html \
&& sudo cp proxy.conf /etc/apache2/mods-available/proxy.conf \
&& sudo sed -i -e 's/80/8889/g' /etc/apache2/ports.conf \
&& sudo cp -p /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf.orig \
&& sudo cp 000-default.conf /etc/apache2/sites-enabled/000-default.conf \
&& sudo a2ensite 000-default.conf \
&& sudo service apache2 restart \
&& set +x