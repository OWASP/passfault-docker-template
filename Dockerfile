FROM ccaamm/passfault:v0.81
MAINTAINER Happy Passfaulter <happyPassfaulter@example.com>

# Copy the words.properties and wordlists into passfault
ADD wordlists ${PASSFAULT_WORDLISTS}
ADD words.properties ${PASSFAULT_WORDLISTS}
