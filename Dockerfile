FROM ghcr.io/pgdogdev/pgdog:main

WORKDIR /app

# Copy all necessary files
COPY . .

# Make the setup script executable
RUN chmod +x setup.sh

# Run setup.sh as entrypoint (generates pgdog.toml)
ENTRYPOINT ["./setup.sh"]

# Default command to run pgdog after setup
CMD ["pgdog", "--config", "pgdog.toml"]
