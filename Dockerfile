# Use the official Tomcat 9 image as the base image
FROM tomcat:9-jdk11-openjdk

# Remove the default ROOT application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your index.jsp file to the Tomcat webapps directory
COPY ./webapp/src/main/webapp/index.jsp /usr/local/tomcat/webapps/ROOT/index.jsp
