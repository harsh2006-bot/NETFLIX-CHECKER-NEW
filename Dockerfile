FROM mcr.microsoft.com/playwright/python:v1.44.0-jammy

WORKDIR /app

# Copy requirements first (faster rebuilds)
COPY requirements.txt .

# Install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install chromium browser for playwright
RUN playwright install chromium

# Copy project files
COPY . .

# Open port for Flask / web service
EXPOSE 5000

# Run bot
CMD ["python3", "netflix_checker.py"]
