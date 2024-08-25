# Start from the third-party image
FROM ghcr.io/actualbudget/actual-server

# Add Pid1 package
ADD https://github.com/fpco/pid1/releases/download/v0.1.3.1/pid1 /usr/bin/pid1
RUN chmod +x /usr/bin/pid1

# Add a script to dynamically create a user and group
COPY entrypoint.sh /entrypoint.sh

# Ensure the script has executable permissions
RUN chmod +x /entrypoint.sh

# Use the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

# Define the default command or service startup
CMD ["node", "app.js"]
