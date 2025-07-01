# Giant AI Neovim Plugin

Semantic code search and AI analysis for development workflows. Integrates with Giant AI's RAG system to provide intelligent code exploration and AI-powered analysis directly in Neovim.

## Features

- **Semantic Code Search** - Find code by meaning, not just keywords
- **AI Analysis** - Get intelligent insights about code patterns and functionality  
- **Project-Aware** - Only works in projects initialized with Giant AI
- **Avante Integration** - Automatically sends analysis to Avante if available
- **Clipboard Fallback** - Results copied to clipboard for use with any AI tool

## Requirements

- **Giant AI CLI tools** - Install from [Giant AI](https://github.com/bearded-giant/giant-ai)
- **Project initialization** - Run `ai-init-project-smart` in your project
- **Project indexing** - Run `ai-rag index .` to enable semantic search

## Installation

### Using lazy.nvim

```lua
{
  "bearded-giant/giant-ai.nvim",
  config = function()
    require('giant-ai').setup({
      provider = "claude",  -- Options: claude, openai, anthropic, gemini, ollama
      limit = 5,           -- Number of search results
      keymaps = {
        search_raw = "<leader>rs",      -- Raw search keymap
        search_analyze = "<leader>ra",  -- AI analysis keymap
      },
      auto_setup = true,   -- Show status message on startup
    })
  end,
}
```

Example configurations for different providers:

```lua
-- OpenAI (requires OPENAI_API_KEY)
require('giant-ai').setup({ provider = "openai" })

-- Anthropic API (requires ANTHROPIC_API_KEY)
require('giant-ai').setup({ provider = "anthropic" })

-- Ollama for local models
require('giant-ai').setup({ provider = "ollama" })

### Using packer.nvim

```lua
use {
  "bearded-giant/giant-ai.nvim",
  config = function()
    require('giant-ai').setup()
  end
}
```

### Local Development

```lua
{
  "bearded-giant/giant-ai.nvim",
  dir = "~/dev/lua/giant-ai.nvim",  -- Local development path
  config = function()
    require('giant-ai').setup()
  end,
}
```

## Configuration

Default configuration:

```lua
{
  provider = "claude",           -- AI provider: claude, openai, anthropic, gemini, ollama
  limit = 5,                    -- Number of search results
  keymaps = {
    search_raw = "<leader>rs",   -- Keymap for raw search
    search_analyze = "<leader>ra" -- Keymap for AI analysis
  },
  auto_setup = true             -- Show status message on startup
}
```

## Usage

### Commands

- `:GiantAISearch [query]` - Semantic search (copies results to clipboard)
- `:GiantAIAnalyze [query]` - AI analysis of search results
- `:GiantAIStatus` - Show project status and configuration

### Keymaps (default)

- `<leader>rs` - Search word under cursor or visual selection
- `<leader>ra` - Analyze word under cursor or visual selection

### Project States

The plugin shows different messages based on project state:

1. **Not initialized**: "Run 'ai-init-project-smart' to enable Giant AI features"
2. **Initialized but not indexed**: "Run 'ai-rag index .' to enable semantic search"  
3. **Ready**: "Ready! Use <leader>ra for AI analysis"

## Workflow

1. **Initialize project**: `ai-init-project-smart`
2. **Index codebase**: `ai-rag index .`
3. **Search semantically**: `<leader>rs` or `:GiantAISearch error handling`
4. **Get AI analysis**: `<leader>ra` or `:GiantAIAnalyze authentication`

## Integration

### Avante Integration

If [Avante](https://github.com/yetone/avante.nvim) is installed, AI analysis results are automatically sent to Avante for interactive chat. Otherwise, results are copied to clipboard.

### AI Provider Support

The plugin supports all Giant AI providers:

#### Claude (Default)
```lua
provider = "claude"  -- Uses Claude Code CLI (Desktop or Web)
```

#### OpenAI
```lua
provider = "openai"  -- Requires OPENAI_API_KEY
```

#### Anthropic API
```lua
provider = "anthropic"  -- Requires ANTHROPIC_API_KEY
```

#### Google Gemini
```lua
provider = "gemini"  -- Requires GEMINI_API_KEY
```

#### Ollama (Local Models)
```lua
provider = "ollama"  -- For self-hosted models
```

**Note**: Configure API keys as environment variables or in your Giant AI `agent.yml` configuration.

## Development

The plugin is designed for local development and testing. The source is located at `~/dev/lua/giant-ai.nvim/` and can be modified directly.

## License

Licensed under the Apache License 2.0. Part of the Giant AI project by [Bearded Giant, LLC](https://beardedgiant.com).

## Contributing

Issues and pull requests welcome! This plugin is part of the larger [Giant AI](https://github.com/bearded-giant/giant-ai) project.