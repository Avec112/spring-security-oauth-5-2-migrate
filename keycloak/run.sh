#!/bin/bash
 
# https://stackoverflow.com/a/246128/1098564
#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
 
# https://stackoverflow.com/a/47181236/1098564
wget -c https://downloads.jboss.org/keycloak/9.0.3/keycloak-9.0.3.zip

 
#https://askubuntu.com/a/994965/109301
unzip -n keycloak-9.0.3.zip
cd keycloak-9.0.3/bin
./add-user-keycloak.sh -r master -u admin -p password
./add-user-keycloak.sh -r oauth2-sample -u user1 -p password
./standalone.sh -Djboss.socket.binding.port-offset=10 -Dkeycloak.migration.action=import -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.file=../../oauth2-sample-realm-config.json -Dkeycloak.migration.strategy=OVERWRITE_EXISTING
