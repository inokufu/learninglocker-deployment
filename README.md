# LearningLocker Docker Setup

This repository provides a Dockerized setup for [LearningLocker](https://github.com/LearningLocker/learninglocker), an open-source learning record store. It leverages Docker, Docker Compose, and a Makefile to simplify building, running, and managing the application and its dependencies.

## Prerequisites

- **Docker:**  
  Make sure [Docker is installed](https://docs.docker.com/get-docker/) and running on your system.

- **Docker Compose:**  
  Depending on your Docker version, you may have Docker Compose integrated as a plugin (`docker compose`) or as a standalone binary (`docker-compose`). The Makefile automatically detects which command to use.

## Getting Started

### 1. Clone the Repository

Clone this repository and navigate into its directory:

```bash
git clone <repository-url>
cd <repository-directory>
```

### 2. Configure Environment Variables

Create an `.env` file in the root directory. You can use the provided sample file `.env.default` as a starting point. Adjust the values as needed.

### 3. Build and Start the Services

The provided Makefile includes several targets for managing the project. Use these commands to build and run your application:

- **Build the Docker images:**

  ```bash
  make build
  ```

- **Start the containers in detached mode:**

  ```bash
  make up
  ```

- **Alternatively, build and start in one step:**

  ```bash
  make build-up
  ```

### 4. Stopping the Services

To stop and remove the containers, run:

```bash
make down
```

## Additional Commands

The Makefile also provides extra commands for administrative tasks:

- **Create a Site Administrator:**  
  Ensure you have set `MASTER_EMAIL`, `MASTER_PASSWORD`, and `ORGANIZATION_NAME` in your `.env` file, then run:
  ```bash
  make create-site-admin
  ```

- **Disable Website Registration:**  
  Run:
  ```bash
  make disable-register
  ```

## Customization

- **Environment Selection:**  
  By default, the configuration uses the `dev` environment. To use a different environment (e.g., `prod`), set the `ENV` variable when running commands:
  ```bash
  ENV=prod make up
  ```

- **Docker Compose Configuration:**  
  The main Compose file is `docker-compose.yml`, with environment-specific overrides in files like `docker-compose.dev.yml` or `docker-compose.prod.yml`. Adjust these as needed.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
