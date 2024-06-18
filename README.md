## Table of Contents

- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running the App](#running-the-app)
- [Running Tests](#running-tests)
- [Using Docker](#using-docker)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Ensure you have the following installed:

- Ruby (version 3.1.6)
- Rails (version 7.1.3)
- PostgreSQL 12
- Docker and Docker Compose

### Installation

1. Clone the repository:
   ```bash
    git clone https://github.com/truongvthai12/share-video.git
    cd share-video
   ```
2. Install dependencies:
   ```bash
    bundle install
   ```
3. Set up the database:
   ```bash
    rails db:create
    rails db:migrate
   ```
4. Running the App

Start the Rails server:
   ```bash
     rails server
   ```
   Navigate to http://localhost:3000 in your browser to see the application running.

### Running Tests
   Using RSpec

   This project uses RSpec for testing. To run the tests, execute:

   ```bash
   bundle exec rspec
   ```
### Using Docker

#### Build and Run the App with Docker

1. Build the Docker containers:
```bash
docker-compose build
```
2. Run the Docker containers:
```bash
docker-compose up
```

4. Setup database 
```bash
docker-compose exec app rails db:create
docker-compose exec app rails db:migrate
```
3. Navigate to http://localhost:3000 in your browser to see the application running.



#### Stop the Docker Containers


To stop the containers:

```bash
docker-compose down
```

#### Test inside a Docker container, use the following command:

```bash
docker-compose exec app rspec
```



 