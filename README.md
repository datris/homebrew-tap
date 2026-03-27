# Homebrew Tap for Datris

[Datris](https://datris.ai) — The First AI Agent-Native Data Platform

## Install

```bash
brew tap datris/tap
brew install datris
```

## Usage

```bash
datris --help
datris ingest data.csv --dest postgres
datris query "SELECT * FROM my_table"
datris search "quarterly revenue" --store pgvector
```

## Update

```bash
brew upgrade datris
```

## Links

- [Documentation](https://datris.ai/docs)
- [GitHub](https://github.com/datris/datris-platform-oss)
- [PyPI](https://pypi.org/project/datris-mcp-server/)
- [MCP Registry](https://registry.modelcontextprotocol.io/servers/io.github.datris/datris)
