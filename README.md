#To encrypt password using jasypt

## Description

This repository contains the docker file which is simple text file that contains a list of commands to build an image and run to encrypt the password using jasypt(reads in jasypt_password as an environmental variable from a external file )

Documentation on Jasypt:

 - http://www.jasypt.org/cli.html

## Cloning the repository using the command line

1. Under the repository name, click Clone or download and in the “Clone with HTTPs” section, copy the URL for your repository.

2. Next, on your local machine, open your bash shell and change your current working directory to the location where you would like to clone your repository.

4. Once you have navigated to the directory where you want to put your repository, you can use:

3. The git clone command copies the repository from GitHub to your local computer


# Requirements:

To get started with Docker follow the links for Mac and Windows:

https://docs.docker.com/get-docker/

https://docs.docker.com/docker-for-windows/

https://docs.docker.com/docker-for-mac/

# How to build the Docker image:

From the folder where you copied the repository run below,

  docker build -t <name the image> .

Example:

  docker build -t myjasypt .

# How to use this Docker image to encrypt password using jasypt:

Password to be encrypted and secret key used for encryption is stored in encrypt.env file.

Environment var

- ALGORITHM: PBEWithMD5AndDES (set as default for testing purpose)

- JASYPT_PASSWORD: <enter the password to be encrypted>

- MY_PASSWORD: <secret key to be used while encryption>

Run the following command to encrypt the password

 docker run --rm --env-file=encrypt.env myjasypt

# How to Validate the jasypt encrypted password

You can Validate the jasypt encrpted password by,

- Uncomment line 22 and comment line 19 in the Docker file.

- Run following command to build an image to decrypt encrypted password

  docker build -t <name the image> .

  Example:

  docker build -t myjasyptdecrypt .

- Change the values accordingly in decrypt.env file

- Run the following command to decrypt the encrypted password

   docker run --rm --env-file=decrypt.env myjasyptdecrypt
























