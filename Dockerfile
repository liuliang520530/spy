FROM xieshang1111/auto_spy:x86
RUN apt update \
    DEBIAN_FRONTEND=noninteractive apt install ssh wget npm apache2 php php-curl php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring  php-xml php-pear php-bcmath  -y \
    npm install -g wstunnel \
    mkdir /run/sshd \
    a2enmod proxy \
    a2enmod proxy_http \
    a2enmod proxy_wstunnel \
    a2enmod  rewrite \
    wget https://raw.githubusercontent.com/uncleluogithub/areyouok/main/000-default.conf \
    rm /etc/apache2/sites-available/000-default.conf \
    mv 000-default.conf /etc/apache2/sites-available \
    cp auto_spy.yaml auto_spy.yaml \
    echo 'You can play the awesome Cloud NOW! - Message from Uncle LUO!' >/var/www/html/index.html \
    echo 'wstunnel -s 0.0.0.0:8989 & ' >>/luo.sh \
    echo 'service mysql restart' >>/luo.sh \
    echo 'service apache2 restart' >>/luo.sh \
    echo '/usr/sbin/sshd -D' >>/luo.sh \
    echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config \
    echo root:uncleluo|chpasswd \
    chmod 755 /luo.sh
EXPOSE 80
CMD  /luo.sh
