Run-up docker image and pushing it to docker-hub repo.


-----------------------------------------------------
When docker image is ready go throuph the next steps...
--------------------------
For listening port on localhost execute command:

$ docker run --rm -it -p 127.0.0.1:3000:8080 <id_image>
--------------------------

-------------------------
pushing image to docker hub on repo

Create Repo on https://hub.docker.com/ and follow of namespacing rules.
------------------------
------------------------
Make sure you are logged in locally within the Docker CLI

Execute command:
$ docker login
------------------------
------------------------
Push image to repo on the docker-hub:

$ docker push <hub-user>/<repo-name>:<tag>

make sure you choose the right tag =)
