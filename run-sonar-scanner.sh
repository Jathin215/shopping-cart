#!/bin/bash

# Define project and SonarQube server information
PROJECT_KEY="shopping-cart"
PROJECT_NAME="shopping-cart"
SONAR_URL="http://18.208.133.148:9000"
SONAR_LOGIN="squ_25aa45643eae7d563624e8cb08ce4f0ddb7105d8"

# Define paths for the source code and binary files
SOURCE_PATH="src/main/java"
TEST_PATH="src/test/java"
BINARY_PATH="target/classes"

# Check if the necessary directories exist
if [ ! -d "" ]; then
    echo "Warning:  does not exist. Skipping test directory."
    TEST_PATH=""
fi

# Run SonarQube analysis
/var/lib/jenkins/tools/hudson.plugins.sonar.SonarRunnerInstallation/sonar-scanner/bin/sonar-scanner   -Dsonar.projectKey=   -Dsonar.projectName=   -Dsonar.java.binaries=   -Dsonar.sources=   -Dsonar.tests=   -Dsonar.exclusions="**/test/**"   -Dsonar.host.url=   -Dsonar.login=

# Capture the exit code and print the result
EXIT_CODE=0
if [  -ne 0 ]; then
    echo "SonarQube analysis failed with exit code ."
    exit 
else
    echo "SonarQube analysis completed successfully."
fi
