# Command-line usage

After installation, Git will use Git Credential Manager Core and you will only need to interact with any authentication dialogs asking for credentials.
GCM Core stays invisible as much as possible, so ideally you’ll forget that you’re depending on GCM at all.

Assuming GCM Core has been installed, use your favorite terminal to execute the following commands to interact directly with GCM.

```shell
git credential-manager-core [<command> [<args>]]
```

## Commands

### --help / -h / -?

Displays a list of available commands.

### --version

Displays the current version.

### get / store / erase

Commands for interaction with Git. You shouldn't need to run these manually.

Read the [Git manual](https://git-scm.com/docs/gitcredentials#_custom_helpers) about custom helpers for more information.

### configure/unconfigure

Set your user-level Git configuration (`~/.gitconfig`) to use GCM Core. If you pass
`--system` to these commands, they act on the system-level Git configuration
(`/etc/gitconfig`) instead.

### azure-repos (experimental)

Interact with the Azure Repos host provider to bind/unbind user accounts to Azure DevOps
organizations or specific remote URLs, and manage the authentication authority cache.

For more information about managing user account bindings see [here](azrepos-users-and-tokens.md#useraccounts).
