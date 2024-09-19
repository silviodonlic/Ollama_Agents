#!/bin/bash

clear

# Define the environment name as a variable
CONDA_ENV_NAME="ollama_agents"

# Check if crew-ai Conda environment is active
if [[ "$CONDA_DEFAULT_ENV" != "$CONDA_ENV_NAME" ]]; then
    echo "Activating $CONDA_ENV_NAME environment..."
    # Source the conda.sh script to enable conda command in the script
    source ~/miniconda3/etc/profile.d/conda.sh
    # Activate the crew-ai environment
    conda activate $CONDA_ENV_NAME
    
    # Check if activation was successful
    if [[ "$CONDA_DEFAULT_ENV" != "$CONDA_ENV_NAME" ]]; then
        echo "Failed to activate $CONDA_ENV_NAME environment. Exiting."
        exit 1
    fi
fi

echo -e "---> \e[32m$CONDA_DEFAULT_ENV\e[0m"
# Verify database setup
if python src/utils/verify_db_setup.py; then
    echo "Database is properly set up."
else
    echo "Database not initialized. Initializing now..."
    python src/utils/initialize_db.py
    
    # Verify again after initialization
    if python src/utils/verify_db_setup.py; then
        echo "Database has been successfully initialized."
    else
        echo "Failed to initialize database. Please check the logs and try again."
        exit 1
    fi
fi

python -m src.main
