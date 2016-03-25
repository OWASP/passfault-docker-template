# OWASP Passfault: Do Passwords Better!

This image lets you extend the OWASP Passfault docker image with your own custom wordlists

## Custom wordlists
Put custom wordlists in the `wordlists` directory.  We recommend the excellent CeWL tool for crawling a domain and generating a domain specific wordlist. https://digi.ninja/projects/cewl.php

Then modify the words.properties file in this directory to include a reference to the new wordlist:

## build the docker image
`docker build -t custom-passfault .
`docker run -d custom-passfault`

You can verify it is up and running at https://{container-ip}:8443
Alternatively you can expose the SSL port as follows:

`docker run -d -p 8443:8443 ccaamm/passfault`
