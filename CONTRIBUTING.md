# Contributing to Slack2Jira Workflow Agent

Thank you for your interest in contributing to the Slack2Jira Workflow Agent! This project demonstrates the power of Model Context Protocol (MCP) tools in creating seamless integrations between different platforms.

## 🤝 How to Contribute

### Reporting Issues

If you find a bug or have a feature request:

1. **Search existing issues** to avoid duplicates
2. **Create a new issue** with a clear title and description
3. **Include relevant details**:
   - Steps to reproduce (for bugs)
   - Expected vs actual behavior
   - Environment details (OS, Python version, etc.)
   - Error messages or logs

### Submitting Changes

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/your-feature-name`
3. **Make your changes** following our coding standards
4. **Test your changes** thoroughly
5. **Commit with clear messages**: Use conventional commit format
6. **Push to your fork**: `git push origin feature/your-feature-name`
7. **Create a Pull Request** with a detailed description

## 📋 Development Guidelines

### Code Style

- **Python**: Follow PEP 8 guidelines
- **Jupyter Notebooks**: Use clear markdown documentation
- **Comments**: Write clear, concise comments for complex logic
- **Documentation**: Update README and docstrings for new features

### Testing

- Test your changes with different Slack thread configurations
- Verify Jira story creation works correctly
- Ensure MCP tool registration functions properly
- Test environment setup scripts on clean systems

### Commit Messages

Use conventional commit format:
```
type(scope): description

[optional body]

[optional footer]
```

Types:
- `feat`: New features
- `fix`: Bug fixes
- `docs`: Documentation changes
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Test additions or changes
- `chore`: Maintenance tasks

### Pull Request Guidelines

1. **Clear Title**: Describe what the PR accomplishes
2. **Detailed Description**: Explain the changes and why they're needed
3. **Link Issues**: Reference related issues using `#issue-number`
4. **Screenshots**: Include screenshots for UI changes
5. **Testing**: Describe how you tested the changes

## 🏗️ Development Setup

### Prerequisites

- Python 3.8+
- Git
- Jupyter Notebook
- Access to Slack and Jira instances for testing

### Local Development

1. **Clone your fork**:
   ```bash
   git clone https://github.com/redhat-ai-tools/Slack2Jira.git
   cd Slack2Jira
   ```

2. **Set up environment**:
   ```bash
   ./setup.sh
   ```

3. **Configure environment**:
   ```bash
   cp env.example .env
   # Edit .env with your test configuration
   ```

4. **Start development**:
   ```bash
   source venv/bin/activate
   jupyter notebook
   ```

## 🎯 Areas for Contribution

### High Priority

- **Error Handling**: Improve error handling and user feedback
- **Documentation**: Enhance setup guides and troubleshooting
- **Testing**: Add comprehensive test coverage
- **Performance**: Optimize agent response times

### Feature Enhancements

- **Attachment Support**: Handle file attachments from Slack
- **Duplicate Detection**: Check for similar existing Jira issues
- **Priority Detection**: Automatic priority assignment
- **Multi-platform Support**: Extend to other platforms

### Infrastructure

- **CI/CD**: Set up automated testing and deployment
- **Docker**: Containerization for easy deployment
- **Monitoring**: Add logging and metrics collection
- **Security**: Enhance security practices

## 🐛 Bug Reports

When reporting bugs, please include:

- **Environment**: OS, Python version, dependency versions
- **Configuration**: Relevant environment variables (sanitized)
- **Steps to Reproduce**: Clear, step-by-step instructions
- **Expected Behavior**: What should happen
- **Actual Behavior**: What actually happens
- **Logs**: Relevant error messages or logs
- **Screenshots**: If applicable

## 💡 Feature Requests

For feature requests, please provide:

- **Use Case**: Why is this feature needed?
- **Description**: Detailed description of the proposed feature
- **Examples**: Concrete examples of how it would work
- **Alternatives**: Any alternative solutions you've considered
- **Implementation Ideas**: If you have technical suggestions

## 📚 Documentation

Documentation improvements are always welcome:

- **README**: Keep the main README up to date
- **Code Comments**: Add or improve inline documentation
- **Examples**: Provide more usage examples
- **Tutorials**: Create step-by-step guides
- **API Documentation**: Document functions and classes

## 🔒 Security

If you discover a security vulnerability:

1. **Do NOT** create a public issue
2. **Email** the maintainers directly
3. **Provide** detailed information about the vulnerability
4. **Wait** for a response before disclosing publicly

## 📄 License

By contributing to this project, you agree that your contributions will be licensed under the MIT License.

## 🙏 Recognition

All contributors will be recognized in our README and release notes. We appreciate every contribution, no matter how small!

## 📞 Getting Help

If you need help with contributing:

- **Issues**: Create an issue with the `question` label
- **Discussions**: Use GitHub Discussions for general questions
- **Documentation**: Check existing documentation first

---

**Thank you for contributing to the Slack2Jira Workflow Agent!** 🚀