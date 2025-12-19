# SRAM-containers
Containers for SURF Research Access Management.

This repository provides containers for all separate containers that comprise the SURF Research Access Management platform.  Together with the deploy scripts in SURFscz/SRAM-deploy, this allows you to deploy a SURF Research Access Management clone in a (plain docker) containerenvironment.

Please be aware that this is very mucht work in progress.  We plan to fully move to a container-based workflow during 2024.

The images in this repository are automatically built in the GitHub workflows using the Dockerfiles, whereas the makefiles are used for local development purposes. In that case, the global Makefile can be used to build and clean all the images at once, and the local Makefiles can be used to start and run the individual docker images.
