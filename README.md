# OWASP Passfault: Do Passwords Better!

This image lets you extend the OWASP Passfault docker image with your own custom wordlists, and with an auto-generated self-signed certificate for TLS encrypted traffic.

## Custom wordlists
Put custom wordlists in the `wordlists` directory.  We recommend the excellent CeWL tool for crawling a domain and generating a domain specific wordlist. https://digi.ninja/projects/cewl.php

Then modify the `words.properties` file in this directory to include a reference to the new wordlist.  

## Build the docker image
Running on a docker machine, you can build your own image by changing the directory to this project.  Then run the following:
```
docker build -t custom-passfault .
docker run custom-passfault
```

You can verify it is up and running at `http://{container-ip}:8080`, or `https://{container-ip}:8443`

Alternatively you can expose the ports as follows:

`docker run -p 8080:8080 -p 8443:8443 custom-passfault`


## TLS configuration
This template will generate a self-signed certificate for TLS encrypted traffic.  To use your own certificates, import the certificate into a keystore with an alias of 'jetty' and install it as ${JETTY_BASE}/etc/keystore. The __storepass__ will have to be 'storepwd' and the __keypass__ must be 'keypwd'.  (Otherwise the jetty configuration will have to be updated to change the default passwords)

## More Details
The [parent image](https://github.com/owasp/passfault-docker) defines the environment variable *PASSFAULT_WORDLISTS* that points to the directory where wordslists are stored.  Also in this directory is the configuration for the wordlists: _wordlists.properties_
This template overwrites the existing template with the one defined in this project.  The syntax of the wordlists should be self-explainatory.


