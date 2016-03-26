# OWASP Passfault: Do Passwords Better!

This image lets you extend the OWASP Passfault docker image with your own custom wordlists

## Custom wordlists
Put custom wordlists in the `wordlists` directory.  We recommend the excellent CeWL tool for crawling a domain and generating a domain specific wordlist. https://digi.ninja/projects/cewl.php

Then modify the `words.properties` file in this directory to include a reference to the new wordlist.  

## build the docker image
Running on a docker machine, you can build your own image by changing the directory to this project.  Then run the following:
```
docker build -t custom-passfault .
docker run -d custom-passfault
```

You can verify it is up and running at http://{container-ip}:8080
Alternatively you can expose the port as follows:

`docker run -d -p 8080:8080 ccaamm/passfault`

## More Details
The [parent image](https://github.com/c-a-m/passfault-docker) defines the environment variable *PASSFAULT_WORDLISTS* that points to the directory where wordslists are stored.  Also in this directory is the configuration for the wordlists: _wordlists.properties_
This template overwrites the existing template with the one defined in this project.  The syntax of the wordlists should be self-explainatory.
