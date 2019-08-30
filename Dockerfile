FROM openjdk:8-jre-slim

WORKDIR /usr/share

# Add the project jar & copy dependencies
ADD  target/TestSuiteDocker-0.0.1-SNAPSHOT.jar TestSuiteDocker-0.0.1-SNAPSHOT.jar

# Add the suite xmls
ADD order-module.xml order-module.xml
ADD search-module.xml search-module.xml

# Command line to execute the test
# Expects below ennvironment variables
# BROWSER = chrome / firefox
# MODULE  = order-module / search-module
# GRIDHOST = selenium hub hostname / ipaddress

ENTRYPOINT java -cp TestSuiteDocker-0.0.1-SNAPSHOT.jar -DseleniumHubHost=$SELENIUM_HUB -Dbrowser=$BROWSER org.testng.TestNG $MODULE

