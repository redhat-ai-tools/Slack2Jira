#!/bin/bash

# Slack2Jira Workflow Agent Setup Script

echo "🚀 Setting up Slack2Jira Workflow Agent..."

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.8 or higher."
    exit 1
fi

# Check Python version
python_version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
echo "✅ Python version: $python_version"

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source venv/bin/activate

# Install dependencies
echo "📥 Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
    echo "⚙️ Creating .env file from template..."
    cp env.example .env
    echo "📝 Please edit .env file with your configuration values"
else
    echo "✅ .env file already exists"
fi

# Create src directory if it doesn't exist
if [ ! -d "src" ]; then
    echo "📁 Creating src directory..."
    mkdir -p src
fi

echo ""
echo "🎉 Setup complete!"
echo ""
echo "Next steps:"
echo "1. Edit .env file with your configuration"
echo "2. Ensure your Llama Stack server is running"
echo "3. Configure your Slack and Jira MCP servers"
echo "4. Run: source venv/bin/activate"
echo "5. Run: jupyter notebook Slack2Jira_Workflow_Agent.ipynb"
echo ""
echo "📚 For more information, see README.md"
echo "🚀 Happy coding!"