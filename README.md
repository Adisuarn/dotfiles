## Initial Setup

The first thing you need to do is to clone this repo into a location of your choosing. For example, if you have a `~/dev` directory where you clone all of your git repos, that's a good choice for this one, too. This repo is setup to not rely on the location of the dotfiles, so you can place it anywhere.

> [!Note]
>
> If you're on macOS, you'll also need to install the XCode CLI tools before continuing.

```bash
xcode-select --install
```

> [!Note]
>
> This dotfiles configuration is set up in such a way that it _shouldn't_ matter where the repo exists on your system.

## The `dot` Command

This repository includes a powerful `dot` command for managing your dotfiles. It replaces the previous `install.sh` script with a more flexible and maintainable solution.

### Configuration

The tool respects these environment variables:
- `DOTFILES`: Path to your dotfiles directory
- `PATH`: For discovering external commands

By default, the following directories are ignored when linking:
- bin
- applescripts
- resources

### Basic Usage

```bash
dot help                    # Show help message and available commands
dot backup                  # Backup existing dotfiles
dot link [package]          # Link all or specific package
dot unlink [package]        # Unlink all or specific package
```

>[!important]
>
>This command won't be in the path until ZSH is properly configured.
> Until that's the case, you can run the command from the dotfiles root.
> ```bash
> bin/dot <command> <subcommand>
>```
```

### Backup Options

The backup command creates a backup of your existing dotfiles before installing new ones:

```bash
dot backup -d <directory>   # Specify backup directory (default: ~/dotfiles-backup)
dot backup -v               # Verbose output
```

This will back up important files and directories including:
- Existing dotfiles in your home directory
- Neovim configuration (`~/.config/nvim/`)
- Vim configuration (`~/.vim/` and `~/.vimrc`)

### Link/Unlink Options

```bash
dot link -v                # Verbose output
dot link -t <target>       # Specify target directory
dot link <package>         # Link specific package
dot link all               # Link all packages
```

### Built-in Commands

#### Git Configuration (`dot git`)

```bash
dot git setup    # Configure git user settings interactively
```

Sets up personalized Git configuration including name, email, and Github username. The configuration is saved to `~/.gitconfig-local`.

#### macOS Settings (`dot macos`)

```bash
dot macos defaults    # Configure recommended macOS system defaults
```

Configures various macOS system settings including:
- Finder: show all filename extensions
- Show hidden files by default
- Only use UTF-8 in Terminal.app
- Expand save dialog by default
- Enable full keyboard access for all controls
- Enable subpixel font rendering on non-Apple LCDs
- Use current directory as default search scope in Finder
- Show Path bar and Status bar in Finder
- Optimize keyboard settings for development

#### Shell Configuration (`dot shell`)

```bash
dot shell change     # Change default shell to zsh
dot shell terminfo   # Install terminal information files
```

These commands may not always be reqired. For example, macOS now sets the default shell to ZSH. And, the terminfo is only requried if you're interested in having italic support in Neovim.

#### Homebrew Management (`dot homebrew`)

```bash
dot homebrew install    # Install Homebrew package manager
dot homebrew bundle     # Install packages from Brewfile
```

Using this command is only needed if your machine does not currently have Homebrew installed. You can also install if the main way by following the [instructions on their website](https://brew.sh).

#### Legacy Cleanup (`dot legacy`)

```bash
dot legacy clean    # Clean up broken legacy symlinks
```

This legacy command specifically cleans up the old symlinks that might exist from rpevious iterations of this repository.


### ZSH plugins

There are a number of plugins in use for ZSH, and they are installed and
maintained separately via the `zfetch` command. `zfetch` is a custom plugin
manager available [here](./zsh/functions/zfetch). The plugins that are used are
listed in the `.zshrc` and include

- [zsh-async](https://github.com/mafredri/zsh-async)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-npm-scripts-autocomplete](https://github.com/grigorii-zander/zsh-npm-scripts-autocomplete)
- [fzf-tab](https://github.com/Aloxaf/fzf-tab)

Additional plugins can be added to the `~/.zshrc`, or to `~/.localrc` if you
want them to stay out of git.

```bash
# Add a line like this and the plugin will automatically be downloaded and sourced
zfetch nicknisi/work-scripts
```

### Prompt

Aloxaf/fzf-tab The prompt is meant to be simple while still providing a lot of
information to the user, particularly about the status of the git project, if
the PWD is a git project. This prompt sets `precmd`, `PROMPT` and `RPROMPT`. The
`precmd` shows the current working directory in it and the `RPROMPT` shows the
git and suspended jobs info. The main symbol used on the actual prompt line is
`❯`.

The prompt attempts to speed up certain information lookups by allowing for the
prompt itself to be asynchronously rewritten as data comes in. This prevents the
prompt from feeling sluggish when, for example, the user is in a large git repo
and the git prompt commands take a considerable amount of time.

It does this by writing the actual text that will be displayed int he prompt to
a temp file, which is then used to update the prompt information when a signal
is trapped.

#### Git Prompt

The git info shown on the `RPROMPT` displays the current branch name, along with
the following symbols.

- `+` - New files were added
- `!` - Existing files were modified
- `?` - Untracked files exist that are not ignored
- `»` - Current changes include file renaming
- `✘` - An existing tracked file has been deleted
- `$` - There are currently stashed files
- `=` - There are unmerged files
- `⇡` - Branch is ahead of the remote (indicating a push is needed)
- `⇣` - Branch is behind the remote (indicating a pull is needed)
- `⇕` - The branches have diverged (indicating history has changed and maybe a
  force-push is needed)
- `✔` - The current working directory is clean

#### Jobs Prompt

The prompt will also display a `✱` character in the `RPROMPT` indicating that
there is a suspended job that exists in the background. This is helpful in
keeping track of putting vim in the background by pressing CTRL-Z.

## tmux configuration

I prefer to run everything inside of [tmux](https://github.com/tmux/tmux). I
typically use a large pane on the top for neovim and then multiple panes along
the bottom or right side for various commands I may need to run. There are no
pre-configured layouts in this repository, as I tend to create them on-the-fly
and as needed.

This repo ships with a `tm` command which provides a list of active session, or
provides prompts to create a new one.

```bash
> tm
Available sessions
------------------

1) New Session
Please choose your session: 1
Enter new session name: open-source
```

This configuration provides a bit of style to the tmux bar, along with some
additional data such as the currently playing song (from Apple Music or
Spotify), the system name, the session name, and the current time.

## Docker Setup

A Dockerfile exists in the repository as a testing ground for linux support. To
set up the image, make sure you have Docker installed and then run the following
command.

```bash
docker build -t dotfiles --force-rm --build-arg PRIVATE_KEY="$(cat ~/.ssh/id_rsa)" --build-arg PUBLIC_KEY="$(cat ~/.ssh/id_rsa.pub)" .
```

This should create a `dotfiles` image which will set up the base environment
with the dotfiles repo cloned. To run, execute the following command.

```bash
docker run -it --rm dotfiles
```

This will open a bash shell in the container which can then be used to manually
test the dotfiles installation process with linux.
