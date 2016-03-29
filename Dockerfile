FROM ccaamm/passfault:v0.81
MAINTAINER Happy Passfaulter <happyPassfaulter@example.com>

# Copy the words.properties and wordlists into passfault
ADD wordlists ${PASSFAULT_WORDLISTS}
ADD words.properties ${PASSFAULT_WORDLISTS}

# The following generates keys and a self-signed certificate, all wrapped up in a keystore:
RUN \
  mkdir -p ${JETTY_BASE}/etc && \
  keytool -genkey -noprompt \
  -keyalg RSA \
  -sigalg SHA256withRSA \
  -validity 356 \
  -alias jetty \
  -dname "CN=example, OU=example, O=example" \
  -keystore ${JETTY_BASE}/etc/keystore \
  -storepass storepwd \
  -keypass keypwd

RUN \
  cd ${JETTY_BASE} && \ 
  java -jar ${JETTY_HOME}/start.jar --add-to-startd=https

EXPOSE 8443
