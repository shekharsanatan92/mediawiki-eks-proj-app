#!/usr/bin/env bash

set -euo pipefail

aws eks update-kubeconfig --name "eks-project" --region us-east-1
helm upgrade \
--install \
--wait \
--reuse-values \
--history-max=5 \
--timeout 30m0s \
"mediawiki-release" ./helm

export SERVICE_IP=$(kubectl get svc --namespace default mediawiki-release-helm --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")
sleep 10
export MEDIAWIKI_SITE_SERVER="$(eval echo $SERVICE_IP:80)"
echo "Mediawiki site server name is: http://$MEDIAWIKI_SITE_SERVER"
sed -i 's/localhost:8080/'"$MEDIAWIKI_SITE_SERVER"'/g' mediawikiconfig.sh


