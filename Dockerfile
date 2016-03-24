FROM ccaamm/passfault:v0.8
MAINTAINER Happy Passfaulter <happyPassfaulter@example.com>

# Copy the words.properties and wordlists into passfault
ADD wordlists ${PASSFAULT_WORDLISTS}
ADD words.properties ${PASSFAULT_WORDLISTS}

# Set the owner to the passfault user (passfault is not running as root)
RUN zip -r /var/lib/jetty/webapps/ROOT/WEB-INF/lib/passfault-wordlists-0.8.jar /tmp/zip
RUN chown ${PASSFAULT_USER} /var/lib/jetty/webapps/ROOT/WEB-INF/lib/passfault-wordlists-0.8.jar
