"""
Utility functions for the Slack2Jira Workflow Agent
"""

from termcolor import cprint
import json


def step_printer(steps):
    """
    Pretty print the steps returned from the agent execution
    
    Args:
        steps: List of steps from the agent response
    """
    for i, step in enumerate(steps):
        print(f"\n{'='*60}")
        cprint(f"Step {i+1}: {step.step_type}", "cyan", attrs=["bold"])
        print('='*60)
        
        if hasattr(step, 'step_details'):
            if hasattr(step.step_details, 'text'):
                print(f"Text: {step.step_details.text}")
            
            if hasattr(step.step_details, 'tool_calls'):
                for tool_call in step.step_details.tool_calls:
                    cprint(f"Tool Call: {tool_call.tool_name}", "yellow")
                    if hasattr(tool_call, 'arguments'):
                        print(f"Arguments: {json.dumps(tool_call.arguments, indent=2)}")
            
            if hasattr(step.step_details, 'tool_responses'):
                for tool_response in step.step_details.tool_responses:
                    cprint(f"Tool Response: {tool_response.tool_name}", "green")
                    if hasattr(tool_response, 'content'):
                        print(f"Content: {tool_response.content}")
        
        print()


def format_agent_response(response):
    """
    Format agent response for better readability
    
    Args:
        response: Agent response object
    """
    if hasattr(response, 'content'):
        if isinstance(response.content, str):
            print(response.content)
        elif isinstance(response.content, dict):
            print(json.dumps(response.content, indent=2))
        else:
            print(response.content)
    else:
        print(response) 