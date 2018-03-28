# Hashicorp Environment Portability
#### An exploration into the possibilities for exact environment replication between local and cloud locations, for the purposes of making development faster and easier.

## Synopsis

It is a VERY common issue in modern development, particularly with the adoption of Service Oriented Architectures and
complex devops practices, that highly distributed environments are very difficult to replicate locally for development.
  Some tools are helpful but require differences in production that are difficult to replicate locally.  Take Docker,
  for example, which makes it very easy to create and collaborate on system configuration, but lacks built in service
  discovery and load balancing features.  The purpose of this repo is to explore ways that we can simplify the translation
  of a full microservices infrastructure between production and development by providing a framework that developers can use to build microservices using
  Consul, Nomad, and Terraform.


## Prerequisites

This framework requires the following to work properly:
* AWS CLI tools
  * Both installed and configured with active AWS credentials.
* Vagrant
  * We will need the Vagrant binary to be in path so we can bring everything up.
  * This entire environment will run in and through Vagrant, simplifying the system requirements to launch this cluster. 
