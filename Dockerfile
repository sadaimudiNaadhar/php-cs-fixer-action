FROM php:7.3-cli

RUN apt-get update && apt-get -y install zip unzip wget git

COPY composer.sh composer.sh 

RUN chmod +x composer.sh
RUN ./composer.sh
RUN mv composer.phar /usr/local/bin/composer

RUN wget https://cs.symfony.com/download/php-cs-fixer-v2.phar -O php-cs-fixer
RUN chmod a+x php-cs-fixer
RUN mv php-cs-fixer /usr/local/bin/php-cs-fixer
## RUN php-cs-fixer self-update
## RUN php-cs-fixer

COPY "init.sh" "/init.sh"
RUN chmod +x /init.sh
ENTRYPOINT ["/init.sh"]

