
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Update operating-system packages and install required system tools
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends gcc libssl-dev curl && \
    rm -rf /var/lib/apt/lists/*

# Upgrade Python packaging tools
RUN python -m pip install --no-cache-dir --upgrade \
    pip \
    setuptools==84.2.1 \
    "wheel>=0.46.2"

# Create non-root user
RUN groupadd -r appgroup && \
    useradd -r -g appgroup appuser

# Install application dependencies
COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt && \
    python -m pip install --no-cache-dir --upgrade setuptools==84.2.1 && \
    python -m pip check

# Remove pip and its bundled metadata from the final image
RUN rm -rf /usr/local/lib/python3.11/site-packages/pip \
    /usr/local/lib/python3.11/site-packages/pip-*.dist-info \
    /usr/local/bin/pip*

# Copy application code
COPY . .

# Set ownership
RUN chown -R appuser:appgroup /app

USER appuser

# Health check
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8000/health || exit 1

# Initialize database and start application
CMD python -m app.database_init && \
    uvicorn app.main:app --host 0.0.0.0 --port 8000 --workers 4
