# Module 14: Complete BREAD Functionality for Calculations

## Project Overview

This project implements BREAD functionality (Browse, Read, Edit, Add, Delete) for calculations using FastAPI, SQLAlchemy, PostgreSQL, and a web-based front end.

Users can create calculations, view their calculation history, retrieve individual calculation details, update existing calculations, and delete calculations. The application uses authentication to ensure users can access only their own calculation records.

The project also includes automated testing with Pytest and Playwright, Docker containerization, and GitHub Actions for continuous integration.

## Technologies Used

- Python 3.11
- FastAPI
- SQLAlchemy
- PostgreSQL
- Pydantic
- HTML, CSS, and JavaScript
- Jinja2 Templates
- Pytest
- Playwright
- Docker and Docker Compose
- GitHub Actions
- Trivy security scanning

## BREAD Functionality

The application implements the following calculation operations:

| Operation | HTTP Method | Endpoint | Description |
|---|---|---|---|
| Browse | GET | `/calculations` | Retrieves calculations belonging to the authenticated user |
| Read | GET | `/calculations/{id}` | Retrieves an individual calculation |
| Edit | PUT | `/calculations/{id}` | Updates an existing calculation |
| Add | POST | `/calculations` | Creates a new calculation |
| Delete | DELETE | `/calculations/{id}` | Deletes a calculation |

### Front-End Functionality

The web interface allows authenticated users to:

- Add calculations by selecting an operation and entering numeric operands.
- Browse their saved calculation history.
- View individual calculation details.
- Edit existing calculations.
- Delete calculations.
- Receive validation and error feedback when submitting invalid information.

Supported calculation operations include:

- Addition
- Subtraction
- Multiplication
- Division

The application uses authentication and user-specific database queries to protect calculation records.

## Project Setup and Installation

### 1. Clone the Repository

```bash
git clone https://github.com/DeepLearnDS/module14_is601.git
cd module14_is601
```

### 2. Create and Activate a Virtual Environment

```bash
python3 -m venv venv
source venv/bin/activate
```

### 3. Install Dependencies

```bash
pip install -r requirements.txt
```

### 4. Configure Environment Variables

Configure the required environment variables for the database connection, authentication, and application settings.

Use the project's environment example file if provided. Do not commit passwords, secret keys, or other sensitive credentials.

## Running the Application with Docker

Docker Compose is used to run the application and its supporting services.

Build and start the containers:

```bash
docker compose up -d --build
```

Check the running containers:

```bash
docker compose ps
```

View application logs:

```bash
docker compose logs -f web
```

Open the application in a browser:

- Application: http://localhost:8000
- pgAdmin: http://localhost:5050

The PostgreSQL database runs as a Docker Compose service.

To stop the containers:

```bash
docker compose down
```

This command stops and removes the containers while preserving the named database volume.

## Running Tests Locally

Activate the virtual environment and run:

```bash
python -m pytest -v
```

To run tests with coverage:

```bash
python -m pytest --cov=app --cov-report=term-missing
```

The test suite covers application functionality, database operations, authentication, and API behavior.

Playwright is used for end-to-end browser testing.

If the Playwright browser has not been installed:

```bash
python -m playwright install chromium
```

## GitHub Actions and Continuous Integration

The project includes GitHub Actions workflows to automate testing and build verification.

The workflows support:

- Installing project dependencies.
- Running automated tests.
- Building the Docker image.
- Performing container security scanning with Trivy.

GitHub Repository:

https://github.com/DeepLearnDS/module14_is601

Docker Hub:
https://hub.docker.com/r/codeec/601_module14

## Docker Hub Deployment

Docker Hub is used to publish the application image.

Docker Hub Repository:

[Insert your Docker Hub repository URL here]

The published image can be used to deploy the application in a Docker environment.

## Security

Security measures implemented in the project include:

- Authenticated access to calculation endpoints.
- User-specific calculation retrieval and ownership checks.
- Input validation using Pydantic.
- Container execution using a non-root application user.
- Updated Python dependencies.
- Operating-system package updates.
- Trivy container vulnerability scanning.

## Assignment Deliverables

The project submission includes:

1. GitHub repository containing the application source code, calculation models, BREAD endpoints, tests, and GitHub Actions workflows.
2. Screenshots showing a successful GitHub Actions workflow.
3. Screenshot demonstrating the Docker image published to Docker Hub.
4. Front-end screenshots demonstrating BREAD functionality.
5. A reflection document describing development experiences, challenges, and solutions.

## Conclusion

This project demonstrates the implementation of complete BREAD functionality for user-specific calculations. It combines backend API development, front-end functionality, database integration, automated testing, Docker deployment, and CI/CD practices.