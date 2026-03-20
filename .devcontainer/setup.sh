#!/bin/bash
set -e

# Navigate to repo root (one level up from .devcontainer/)
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

# System dependencies
sudo apt-get update -y
sudo apt-get install -y graphviz

# Create virtual environment and install all dependencies
python3 -m venv .venv_morocco
source .venv_morocco/bin/activate

pip install --upgrade pip
pip install -r Installation/requirements.txt
pip install ipykernel python-dotenv azure-identity graphviz

# Register the venv as a Jupyter kernel
python -m ipykernel install --user --name=agent-framework --display-name "Python (agent-framework) Morocco"

# Create .env from .env.examples if it doesn't exist yet
if [ ! -f ".env" ] && [ -f ".env.examples" ]; then
    cp .env.examples .env
    echo "📝 .env created from .env.examples — fill in your credentials."
fi

echo "✅ Kernel 'agent-framework' installed and ready."
