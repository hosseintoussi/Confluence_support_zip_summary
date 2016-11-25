#!/bin/bash
color='\e[1;34m'
NC='\e[0m'

function seperator (){
echo "================================================================================"
echo "$1"
echo "================================================================================"
}

echo  -e "${color} hello, $USER. This is the tets script to automate a summary for confluence support zip ${NC}"
echo -e "${color} It starts with unzipping the support zip file passed as an argument ${NC}"
# Unzipping the argument given file
fileName=$1
unzip $fileName

# Starting to GREP the info
seperator "The last Start of Confluence" > summary.txt
grep -R -A 23 "Starting Confluence" application-logs |  tail -24 >> summary.txt

seperator "Build Info" >> summary.txt
grep -R "baseUrl =" --exclude=*.sh | tail -1 >> summary.txt
grep -R "home =" | tail -1 >> summary.txt
grep -R "upTime =" | tail -1 >> summary.txt
grep -R "devMode =" | tail -1 >> summary.txt
grep -R "serverId =" | tail -1 >> summary.txt
grep -R "supportEntitlementNumber =" | tail -1 >> summary.txt
grep -R "installationDate =" | tail -1 >> summary.txt
grep -R "version =" | tail -1 >> summary.txt
seperator "Server Info" >> summary.txt
grep -R "Application Server:" | tail -1 >> summary.txt
grep -R "Servlet Version:" | tail -1 >> summary.txt
seperator "Database Info" >> summary.txt
grep -R "Database Dialect:" | tail -1 >> summary.txt
grep -R "Database URL:" | tail -1 >> summary.txt
grep -R "Database Driver Name:" | tail -1 >> summary.txt
grep -R "Database Driver Version:" | tail -1 >> summary.txt
grep -R "Database Version:" | tail -1 >> summary.txt
grep -R "Database Latency (ms):" | tail -1 >> summary.txt
seperator "Usage Info" >> summary.txt
grep -R "totalSpaces =" | tail -1 >> summary.txt
grep -R "localGroups =" | tail -1 >> summary.txt
grep -R "localUsers =" | tail -1 >> summary.txt
grep -R "globalSpaces =" | tail -1 >> summary.txt
grep -R "allContent =" | tail -1 >> summary.txt
grep -R "indexSize =" | tail -1 >> summary.txt
grep -R "personalSpaces =" | tail -1 >> summary.txt
grep -R "currentContent =" | tail -1 >> summary.txt
seperator "System Info & JVM Stats" >> summary.txt
grep -R "javaRuntime =" | tail -1 >> summary.txt
grep -R "operatingSystem =" | tail -1 >> summary.txt
grep -R "jvmVersion =" | tail -1 >> summary.txt
grep -R "fileSystemEncoding =" | tail -1 >> summary.txt
grep -R "javaVendor =" | tail -1 >> summary.txt
grep -R "jvmImplementationVersion =" | tail -1 >> summary.txt
grep -R "systemTimezone =" | tail -1 >> summary.txt
grep -R "appServer =" | tail -1 >> summary.txt
grep -R "favouriteCharacter =" | tail -1 >> summary.txt
grep -R "tempDirectory =" | tail -1 >> summary.txt
grep -R "jvmInputArguments =" | tail -1 >> summary.txt
grep -R "jvmVendor =" | tail -1 >> summary.txt
grep -R "userName =" | tail -1 >> summary.txt
grep -R "javaVersion =" | tail -1 >> summary.txt
grep -R "operatingSystemArchitecture =" | tail -1 >> summary.txt
grep -R "systemLanguage =" | tail -1 >> summary.txt
grep -R "workingDirectory =" | tail -1 >> summary.txt



echo -e "${color} Summary created successfully, opening it now${NC}"

gedit summary.txt
