# Personal Blog Setup Guide

This repository contains a personal blog setup using Obsidian for writing and Hugo for static site generation, following the approach outlined in [jacobian.org/til/hugo-obsidian/](https://jacobian.org/til/hugo-obsidian/).

## Overview

The setup allows you to:
- Write blog posts in Obsidian with full markdown support
- Automatically convert Obsidian notes to Hugo content on git commits
- Publish your blog as a static site using Hugo
- Deploy automatically via Cloudflare Pages (or similar)

## Directory Structure

```
personal-blog/
├── vault/              # Obsidian vault directory - write your content here
├── content/            # Hugo content directory (auto-generated)
├── bin/                # Utility scripts
│   ├── obsidian-export # Tool to convert Obsidian to Hugo format
│   └── make-index-files # Script to create Hugo section indexes
├── .husky/             # Git hooks
│   └── pre-commit      # Automatically processes vault content
├── hugo.toml           # Hugo configuration
└── package.json        # Node.js dependencies for Husky
```

## How It Works

1. **Write in Obsidian**: Create and edit your blog posts in the `vault/` directory using Obsidian
2. **Git commit triggers conversion**: The pre-commit hook automatically:
   - Clears the `content/` directory
   - Exports your Obsidian vault to Hugo-compatible markdown
   - Creates necessary `_index.md` files for Hugo sections
   - Stages the generated content for commit
3. **Hugo builds the site**: Hugo processes the content to generate your static blog
4. **Deploy**: Push to trigger automatic deployment (e.g., via Cloudflare Pages)

## Setup Instructions

### Prerequisites

- Git
- Hugo
- Obsidian
- Node.js (for Husky)
- Rust/Cargo (for obsidian-export)

### Initial Setup (Already Completed)

The following setup has already been completed in this repository:

1. ✅ Git repository initialized
2. ✅ Hugo site structure created
3. ✅ Obsidian vault directory (`vault/`) created
4. ✅ `obsidian-export` tool installed via Cargo
5. ✅ `make-index-files` Python script created
6. ✅ Husky pre-commit hook configured
7. ✅ Required dependencies installed

### Obsidian Configuration

1. **Open Obsidian** and create a new vault
2. **Set vault location** to `/path/to/your/repo/vault/`
3. **Install the obsidian-git plugin**:
   - Go to Settings → Community Plugins
   - Browse and install "Obsidian Git"
   - Enable the plugin
4. **Configure obsidian-git plugin**:
   - Advanced → Custom base path: `..`
   - Backup interval: `5` (or more) minutes
   - Enable auto-pull and auto-push as desired

### Hugo Theme Setup

1. **Choose a theme** from https://themes.gohugo.io/
2. **Install the theme**:
   ```bash
   git submodule add https://github.com/theme-author/theme-name.git themes/theme-name
   ```
3. **Update hugo.toml**:
   ```toml
   theme = "theme-name"
   ```

### Content Creation

1. **Create your first post** in the `vault/` directory
2. **Use proper frontmatter** (Hugo metadata):
   ```markdown
   ---
   title: "My First Post"
   date: 2024-01-01
   draft: false
   ---
   
   Your content here...
   ```
3. **Organize content** in subdirectories as needed (e.g., `vault/posts/`, `vault/about/`)

### Testing Locally

1. **Start Hugo development server**:
   ```bash
   hugo server --buildDrafts
   ```
2. **View your site** at http://localhost:1313
3. **Make changes** in Obsidian and see them reflected after committing

### Deployment

#### Option 1: Cloudflare Pages
1. **Connect your GitHub repository** to Cloudflare Pages
2. **Set build settings**:
   - Build command: `hugo`
   - Build output directory: `public`
   - Root directory: `/`
3. **Enable automatic deployments** on push to main branch

#### Option 2: Other Static Hosts
Similar setup available for:
- Netlify
- Vercel
- GitHub Pages
- AWS S3 + CloudFront

## Workflow

1. **Write in Obsidian**: Create and edit your blog posts
2. **Commit changes**: Use git or the obsidian-git plugin
3. **Automatic processing**: Pre-commit hook handles conversion
4. **Push to deploy**: Trigger automatic deployment
5. **Your blog is live!**

## Key Files

- **`bin/obsidian-export`**: Converts Obsidian vault to Hugo content
- **`bin/make-index-files`**: Creates Hugo section index files
- **`.husky/pre-commit`**: Git hook that automates the conversion process
- **`vault/`**: Your Obsidian content directory
- **`content/`**: Hugo content (auto-generated, don't edit directly)

## Tips

- **Use Obsidian templates** for consistent post structure
- **Organize with folders** in your vault for different content types
- **Use tags and links** freely - they'll be preserved in Hugo
- **Preview locally** with `hugo server` before pushing
- **Backup your vault** regularly (obsidian-git helps with this)

## Troubleshooting

- **Pre-commit hook fails**: Check that `bin/obsidian-export` and `bin/make-index-files` are executable
- **Hugo build errors**: Ensure frontmatter is valid YAML
- **Missing content**: Verify the pre-commit hook ran successfully
- **Theme issues**: Check theme documentation for specific requirements

## Resources

- [Original guide by Jacob Kaplan-Moss](https://jacobian.org/til/hugo-obsidian/)
- [Hugo Documentation](https://gohugo.io/documentation/)
- [Obsidian Help](https://help.obsidian.md/)
- [obsidian-export GitHub](https://github.com/zoni/obsidian-export)