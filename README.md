# Slack2Jira Workflow Agent

[![MCP Hackathon](https://img.shields.io/badge/MCP-Hackathon-blue)](https://github.com/modelcontextprotocol)
[![Python](https://img.shields.io/badge/Python-3.8+-green)](https://python.org)
[![Llama Stack](https://img.shields.io/badge/Llama-Stack-orange)](https://github.com/meta-llama/llama-stack)

An intelligent workflow agent that seamlessly bridges Slack discussions and Jira issue tracking using Model Context Protocol (MCP) tools and Llama Stack. This solution enables automated creation of well-structured Jira stories directly from Slack conversations, preserving context and enhancing team productivity.

## 🎯 Overview

This project creates an integration layer between Slack and Jira MCPs, enabling seamless ticket creation in Jira directly from Slack discussions. The solution enhances team efficiency by allowing users to create Jira tickets without leaving Slack, while preserving discussion context within the tickets.

### Key Features

- **Intelligent Discussion Analysis**: Automatically extracts key information from Slack threads
- **Context Preservation**: Maintains discussion context when creating Jira stories
- **Epic Linking**: Automatically links stories to appropriate epics
- **Professional Formatting**: Creates well-structured Jira stories with proper fields
- **Automated Workflow**: End-to-end process from Slack discussion to Jira story

## 🏗️ Architecture

The system uses:
- **Slack MCP Server**: Retrieves discussion content from Slack channels and threads
- **Jira MCP Server**: Creates and manages Jira issues, including linking stories to epics
- **Llama Stack**: Orchestrates the workflow and provides intelligent analysis
- **ReAct Agent**: Implements the reasoning and action loop for complex workflows

## 📋 Use Cases

### Primary Use Case
Analyze Slack discussion threads, extract key information about technical issues or feature requests, create well-structured Jira stories with appropriate fields, and link them to specified epics.

### What the Agent Does
1. **Extract Information**: Identifies main technical issues, bug reports, or feature requests
2. **Analyze Details**: Captures problem descriptions, reproduction steps, error messages, and proposed solutions
3. **Create Jira Stories**: Generates professional, well-formatted stories with:
   - Clear, descriptive summaries
   - Detailed descriptions with Slack context
   - Proper epic linking
   - Appropriate issue types and project assignments

### Fields Automatically Populated
- **Summary**: Clear, concise title based on discussion
- **Description**: Detailed context from Slack thread
- **Actual Result**: What's currently happening (if discussed)
- **Expected Result**: What should happen (if mentioned)
- **Epic Link**: Automatic linking to specified epics

### Fields for Manual Completion
- **How Reproducible**: To be filled by QE/Developer
- **Steps to Reproduce**: To be filled by QE/Developer

## 🚀 Getting Started

### Prerequisites

Before using this workflow agent, ensure you have:

- Python 3.8 or higher
- Access to a Slack workspace with appropriate permissions
- Access to a Jira instance with issue creation permissions
- Llama Stack server configured and running
- Slack MCP server configured
- Jira MCP server configured

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/Slack2Jira.git
   cd Slack2Jira
   ```

2. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

3. **Set up environment variables**:
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

4. **Configure your `.env` file**:
   ```env
   REMOTE_BASE_URL=your_llama_stack_url
   REMOTE_SLACK_MCP_URL=your_slack_mcp_endpoint
   REMOTE_JIRA_MCP_URL=your_jira_mcp_endpoint
   TAVILY_SEARCH_API_KEY=your_tavily_key (optional)
   TEMPERATURE=0.0
   TOP_P=0.95
   STREAM=False
   ```

### Quick Start

1. **Open the Jupyter notebook**:
   ```bash
   jupyter notebook Slack2Jira_Workflow_Agent.ipynb
   ```

2. **Configure your workflow parameters**:
   ```python
   SLACK_CHANNEL_ID = "your_channel_id"
   SLACK_THREAD_TS = "thread_timestamp"
   JIRA_EPIC_KEY = "your_epic_key"
   JIRA_PROJECT_KEY = "your_project_key"
   ```

3. **Run the workflow**:
   The agent will automatically:
   - Retrieve Slack thread messages
   - Analyze the discussion
   - Get epic details
   - Create a linked Jira story

## 📖 Usage Example

```python
# Configuration
SLACK_CHANNEL_ID = "C08UPFE3VA5"
SLACK_THREAD_TS = "1748436131.235159"
JIRA_EPIC_KEY = "ILAICOMUTY-6"
JIRA_PROJECT_KEY = "ILAICOMUTY"

# Create and run the workflow
agent = ReActAgent(
    client=client,
    model=model_id,
    tools=["mcp::slack", "mcp::jira"],
    sampling_params={"max_tokens": 1024},
)

# Execute the workflow
response = agent.create_turn(
    messages=[{"role": "user", "content": workflow_prompt}],
    session_id=session_id,
    stream=False
)
```

## 🔧 Configuration

### MCP Configuration Example

To use this workflow agent, you'll need to configure MCP servers for both Slack and Jira. Here's an example `mcp.json` configuration:

```json
{
  "mcpServers": {
    "jira": {
      "type": "stdio",
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "-e", "JIRA_URL",
        "-e", "JIRA_PERSONAL_TOKEN",
        "ghcr.io/sooperset/mcp-atlassian:latest"
      ],
      "env": {
        "JIRA_PERSONAL_TOKEN": "<example_personal_token>",
        "JIRA_URL": "https://<example_instance>.atlassian.net"
      }
    },
    "slack": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "-e",
        "SLACK_BOT_TOKEN",
        "-e",
        "SLACK_TEAM_ID", 
        "-e",
        "SLACK_CHANNEL_IDS",
        "mcp/slack"
      ],
      "env": {
        "SLACK_BOT_TOKEN": "<example_bot_token>",
        "SLACK_TEAM_ID": "<example_team_id>",
        "SLACK_CHANNEL_IDS": "<example_channel_id>"
      }
    }
  }
}
```

**Note**: Replace the `<example_*>` placeholders with your actual credentials and configuration values.

### Tool Registration

The system automatically registers MCP tools if they're not already available:

```python
# Slack MCP Tool
if "mcp::slack" not in registered_toolgroups:
    client.toolgroups.register(
        toolgroup_id="mcp::slack",
        provider_id="model-context-protocol",
        mcp_endpoint={"uri": slack_mcp_url},
    )

# Jira MCP Tool
if "mcp::jira" not in registered_toolgroups:
    client.toolgroups.register(
        toolgroup_id="mcp::jira",
        provider_id="model-context-protocol",
        mcp_endpoint={"uri": jira_mcp_url},
    )
```

### Agent Configuration

```python
model_prompt = """You are a helpful assistant specialized in analyzing Slack discussions and creating well-structured Jira stories.

When analyzing Slack discussions, you should:
1. Extract the main technical issue, bug report, or feature request
2. Identify key details like problem descriptions, steps to reproduce, error messages
3. Create clear, concise summaries for Jira story titles
4. Write detailed descriptions with Slack discussion context
5. Link stories to appropriate epics when specified
"""
```

## 🔮 Future Enhancements

The roadmap includes:

- **Attachment Support**: Automatically attach pictures/logs from Slack discussions to Jira tickets
- **Duplicate Detection**: Check for similar existing Jira issues and provide information in Slack
- **Priority Detection**: Automatic priority and severity assignment based on discussion content
- **Multi-platform Sync**: Bidirectional synchronization between Slack and Jira
- **Custom Routing**: Intelligent routing based on discussion content and team assignments
- **Integration Expansion**: Support for GitHub, ServiceNow, and other platforms

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

## 📄 License

## 🔗 Resources

- [Project Documentation](https://docs.google.com/document/d/1JNdvWRqqO6ZmzfGQbMCbB2qG5Qpy4Fs5ftviRT_bMhQ/edit?tab=t.0#heading=h.eqn641rxzrve)
- [Slack MCP Server](https://github.com/modelcontextprotocol/servers/tree/main/src/slack)
- [Jira MCP Server](https://github.com/sooperset/mcp-atlassian)
- [Llama Stack Documentation](https://github.com/meta-llama/llama-stack)
- [Model Context Protocol](https://github.com/modelcontextprotocol)

## 🏆 Acknowledgments

This project was developed as part of the AI MCP Israeli Hackathon, demonstrating the power of Model Context Protocol tools in creating seamless integrations between different platforms.

---

**Built with ❤️ using Llama Stack and MCP Tools**
