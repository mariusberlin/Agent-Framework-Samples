sudo apt update
sudo apt install graphviz -y

# Create virtual environment and install all dependencies
python3 -m venv .venv
source .venv/bin/activate

pip install --upgrade pip
pip install -r Installation/requirements.txt
pip install ipykernel

# Register the venv as a Jupyter kernel named "agent-framework"
python -m ipykernel install --user --name=agent-framework --display-name "Python (agent-framework)"

echo "✅ Kernel 'agent-framework' installed and ready."
