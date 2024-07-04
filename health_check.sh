#! /bin/bash
#color notes
NC='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
cyan='\033[0;36m'
yellow='\033[0;33m'

clear

echo -e "${YELLOW}---------------------------------------------------------------------------------------------------------------${NC}"
echo "APPLICATION STATUS MONITOR"
echo -e "${YELLOW}---------------------------------------------------------------------------------------------------------------${NC}"

result=$(curl -I --head  --request GET http://10.50.47.75:31116  2>/dev/null | head -n 1 | cut -d$' ' -f2)

echo -e "${YELLOW}---------------------------------------------------------------------------------------------------------------${NC}"
if [ "$result" == "200" ]
then
   echo  -e "${GREEN}The Demo Site is UP${NC}"

elif [ "$result" == "404" ]
then
   echo -e "${RED}Demo Site is DOWN${NC}"

else [ "$result" == "503" ]
   echo -e "${YELLOW}Demo Site is not reachable${NC}"
fi
echo -e "${YELLOW}---------------------------------------------------------------------------------------------------------------${NC}"

uptime=$(kubectl get pods | grep frontend | awk '{print $5}')

echo -e "${YELLOW}---------------------------------------------------------------------------------------------------------------${NC}"
echo "Uptime of the Application" $uptime
echo -e "${YELLOW}---------------------------------------------------------------------------------------------------------------${NC}"
