# Use the official OpenJDK image as the base
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the local Maven settings
COPY . /app

# Install Maven and build the project
RUN apt-get update && apt-get install -y maven && mvn clean install

# Run the application
CMD ["java", "-jar", "target/shopping-cart.jar"]
