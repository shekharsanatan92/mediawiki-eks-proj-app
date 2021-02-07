# App stack for MediaWiki

#########################################

Code Format: YAML + Bash

Tech Stack: EKS + Helm + Jenkins

##########################################

This project uses Jenkins pipeline to deploy Mediawiki onto EKS using Helm

Setup:

Clone this repository and navigate to the script file mediawikiconfig.sh. This file consists of configuration paraeters required for MediaWiki. Place the required parameters in the file and save. Build triggers flow through Jenkins server. 

Jenkins pipeline has below stages:
1. Build Mediawiki Base Image
2. Deploy the base image onto EKS - Since we do not have DNS records at this time, we deploy the base image to obtain the service IP (LoadBalancer) to access MediaWiki
3. Configuration of Mediawiki and image update in EKS

Note: Replace fields with ######### with own in mediawikiconfig.sh file
