# renv - You don't need to fight with your .env files

*Managing your .env files should be easy* 🏠

> For everyone who constantly make changes in .env files

**renv** is for your chaotic mind.

# What is renv?

- It can present to you diff between two .env files
- Create your own env.d.ts TypeScript interface from .env file
- **Few dependencies** only Thor is required

## Quick Start

```bash 
# Clone the repository to your desired location
git clone https://github.com/BartekS11/Renv.git /workspaces/renv

# Install dependencies (not much!)
cd /workspaces/renv && bundle install

# Add renv to your PATH and to shell of your choice (bash/zsh/fish)
export PATH="/workspaces/renv/bin:$PATH"' >> ~/.bashrc
```

## Usage
```bash
# Show help and available commands
- renv --help 

# Sync keys across example envs
- renv sync examples/.env examples/.env.dev examples/.env.prod 

# Diff two envs
- renv diff examples/.env.dev examples/.env.prod

# Generate TypeScript types
- renv generate_types --input examples/.env --output types/env.d.ts
```

## License

MIT - Free for everyone, do whatever you want 

---
