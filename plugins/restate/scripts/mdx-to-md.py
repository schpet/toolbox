#!/usr/bin/env python3
"""Convert MDX files to plain Markdown by removing React/JSX components."""

import sys
import re


def escape_template_literals_in_code_blocks(content: str) -> str:
    """Replace JS template literals containing '!' with string concatenation.

    Claude Code interprets `!` followed by backtick as bash syntax when loading skills.
    This converts: return `Hello, ${name}!`;
    To:            return "Hello, " + name + "!";
    """
    def replace_template_literal(match: re.Match) -> str:
        code_block = match.group(0)
        # Only process if it contains template literals with !
        if '!`' not in code_block and '!`;' not in code_block:
            return code_block

        # Find template literals like `...${var}...!` and convert to concatenation
        # This handles simple cases like `Hello, ${name}!`
        def convert_literal(m: re.Match) -> str:
            literal = m.group(0)
            # Simple pattern: `prefix${var}suffix`
            simple_match = re.match(r'`([^`$]*)\$\{([^}]+)\}([^`]*)`', literal)
            if simple_match:
                prefix, var, suffix = simple_match.groups()
                return f'"{prefix}" + {var} + "{suffix}"'
            return literal

        code_block = re.sub(r'`[^`]*\$\{[^}]+\}[^`]*!`', convert_literal, code_block)
        return code_block

    # Match fenced code blocks (```...```)
    content = re.sub(
        r'```[\w]*\n[\s\S]*?```',
        replace_template_literal,
        content
    )
    return content


def convert_mdx_to_md(content: str) -> str:
    """Strip JSX/React components and MDX-specific syntax from content."""

    # First, escape problematic template literals in code blocks
    content = escape_template_literals_in_code_blocks(content)

    # Remove multiline import statements (handle various patterns)
    # Pattern: import ... from "..."
    content = re.sub(
        r'^import\s+[\s\S]*?from\s+[\'"][^\'"]+[\'"];?\s*$',
        '',
        content,
        flags=re.MULTILINE
    )

    # Remove any remaining import lines
    content = re.sub(r'^import\s+.*$', '', content, flags=re.MULTILINE)

    # Remove JSX/TSX comments {/* ... */}
    content = re.sub(r'\{/\*[\s\S]*?\*/\}', '', content)

    # Remove JSX fragment closing tags </>
    content = re.sub(r'</>', '', content)

    # Remove JSX closing tags like </ComponentName>
    content = re.sub(r'</[A-Z][a-zA-Z0-9]*>', '', content)

    # Remove JSX self-closing tags like <ComponentName ... />
    # Handle multiline tags
    content = re.sub(r'<[A-Z][a-zA-Z0-9]*[^>]*/>', '', content, flags=re.DOTALL)

    # Remove JSX opening tags like <ComponentName ...>
    # This needs to handle multiline and nested quotes
    content = re.sub(r'<[A-Z][a-zA-Z0-9]*\s+[^>]*>', '', content, flags=re.DOTALL)
    content = re.sub(r'<[A-Z][a-zA-Z0-9]*>', '', content)

    # Remove <img> tags (lowercase)
    content = re.sub(r'<img\s+[^>]*/?\s*>', '', content, flags=re.DOTALL)

    # Remove remaining JSX curly brace expressions like {someVar} or {`template`}
    # but be careful not to remove code blocks
    # Only remove simple variable references outside of code
    content = re.sub(r'\{[a-zA-Z_][a-zA-Z0-9_]*\}', '', content)

    # Remove JSX props patterns like }/>
    content = re.sub(r'\}\s*/>', '', content)
    content = re.sub(r'\}\s*>', '', content)

    # Remove remaining className props
    content = re.sub(r'\s*className=\{[^}]+\}', '', content)
    content = re.sub(r'\s*className="[^"]*"', '', content)

    # Remove other common JSX props
    content = re.sub(r'\s*groupId="[^"]*"', '', content)
    content = re.sub(r'\s*queryString', '', content)

    # Clean up lines that only have JSX remnants
    content = re.sub(r'^\s*\}\s*$', '', content, flags=re.MULTILINE)
    content = re.sub(r'^\s*\{$', '', content, flags=re.MULTILINE)

    # Clean up excessive blank lines (more than 2 consecutive)
    content = re.sub(r'\n{3,}', '\n\n', content)

    # Clean up lines that are just whitespace
    content = re.sub(r'^\s+$', '', content, flags=re.MULTILINE)

    # Clean up trailing whitespace
    content = re.sub(r'[ \t]+$', '', content, flags=re.MULTILINE)

    return content


def main():
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <input.mdx> <output.md>", file=sys.stderr)
        sys.exit(1)

    src_file = sys.argv[1]
    dest_file = sys.argv[2]

    try:
        with open(src_file, 'r', encoding='utf-8') as f:
            content = f.read()

        converted = convert_mdx_to_md(content)

        with open(dest_file, 'w', encoding='utf-8') as f:
            f.write(converted)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()
