#!/bin/bash

<< comment
Deploy a Django app
and error handling for codes
comment

#!/bin/bash

code_clone() {
    echo "Cloning the Django App..."
    if [ -d "django-notes-app" ]; then
        echo "Code Directory Already Exists! Pulling latest changes..."
        cd django-notes-app
        git pull origin main || { echo "Git pull failed!"; exit 1; }
    else
        git clone https://github.com/Ashik-Ahammad/django-notes-app.git || { echo "Git clone failed!"; exit 1; }
        cd django-notes-app
    fi
}

install_requirements() {
    echo "Installing Dependencies..."
    sudo apt-get install -y docker.io nginx || { echo "Installation Failed!"; exit 1; }
}

required_restarts() {
    echo "Setting up Docker and Nginx..."
    sudo chown $USER /var/run/docker.sock
    sudo systemctl enable docker
    sudo systemctl enable nginx
    sudo systemctl restart docker || { echo "Failed to restart Docker!"; exit 1; }
    sudo systemctl restart nginx || { echo "Failed to restart Nginx!"; exit 1; }
}

deploy() {
    echo "Building Docker Image..."
    docker build -t notes-app . || { echo "Docker Build Failed!"; exit 1; }
    
    echo "Running Docker Container..."
    docker run -d -p 8000:8000 notes-app:latest || { echo "Docker Run Failed!"; exit 1; }
}

echo "------------------ Deployment Started ------------------"

code_clone
install_requirements
required_restarts
deploy

echo "------------------ Deployment Completed ------------------"

