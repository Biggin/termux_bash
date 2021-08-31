# Frequently asked questions

## Authentication problems

### Q: I got an error trying to push/pull/clone. What do I do now?

Please follow these steps to diagnose or resolve the problem:

1. Check if you can access the remote repository in a web browser. If you cannot, this is probably a permission problem and you should follow up with the repository administrator for access. Execute `git remote -v` from a terminal to show the remote URL.

1. If you are experiencing a Git authentication problem using an editor, IDE or other tool, try performing the same operation from the terminal. Does this still fail? If the operation succeeds from the terminal please include details of the specific tool and version in any issue reports.

1. Set the environment variable `GCM_TRACE` and run the Git operation again. Find instructions [here](environment.md#GCM_TRACE).

1. If all else fails, create an issue [here](https://github.com/Microsoft/Git-Credential-Manager-Core/issues/create), making sure to include the trace log.

### Q: I got an error saying unsecure HTTP is not supported.

To keep your data secure, Git Credential Manager Core will not send credentials for Azure Repos, Azure DevOps Server (TFS), GitHub, and Bitbucket, over HTTP connections that are not secured using TLS (HTTPS).

Please make sure your remote URLs use "https://" rather than "http://".

### Q: I got an authentication error and I am behind a network proxy.

You probably need to configure Git and GCM Core to use a proxy. Please see detailed information [here](https://aka.ms/gcmcore-httpproxy).

### Q: I'm getting errors about picking a credential store on Linux.

On Linux you must [select and configure a credential store](https://aka.ms/gcmcore-linuxcredstores), as due to the varied nature of distributions and installations, we cannot guarantee a suitable storage solution is available.

## About the project

### Q: How does this project relate to [Git Credential Manager for Windows](https://github.com/Microsoft/Git-Credential-Manager-for-Windows) and [Git Credential Manager for Mac and Linux](https://github.com/Microsoft/Git-Credential-Manager-for-Mac-and-Linux)?

Git Credential Manager for Windows (GCM Windows) is a .NET Framework-based Git credential helper which runs on Windows.
Likewise the Git Credential Manager for Mac and Linux (Java GCM) is a Java-based Git credential helper that runs only on macOS and Linux. Although both of these projects aim to solve the same problem (providing seamless multi-factor HTTPS authentication with Git), they are based on different codebases and languages which is becoming hard to manage to ensure feature parity.

Git Credential Manager Core (GCM Core; this project) aims to replace both GCM Windows and Java GCM with a unified codebase which should be easier to maintain and enhance in the future.

### Q: Does this mean GCM for Windows (.NET Framework-based) is deprecated?

Yes. Git Credential Manager for Windows (GCM Windows) is no longer receiving updates and fixes. All development effort has now been directed to GCM Core. GCM Core is available as an credential helper option in Git for Windows 2.28, and will be made the default helper in 2.29.

### Q: Does this mean the Java-based GCM for Mac/Linux is deprecated?

Yes. Usage of Git Credential Manager for Mac and Linux (Java GCM) should be replaced with GCM Core or SSH keys. If you wish to install GCM Core on macOS or Linux, please follow the [download and installation instructions](../README.md#download-and-install).

### Q: I want to use SSH

GCM Core is only useful for HTTP(S)-based remotes. Git supports SSH out-of-the box so you shouldn't need to install anything else.

To use SSH please follow the below links:

- [Azure DevOps](https://docs.microsoft.com/en-us/azure/devops/repos/git/use-ssh-keys-to-authenticate?view=azure-devops)
- [GitHub](https://help.github.com/en/articles/connecting-to-github-with-ssh)
- [Bitbucket](https://confluence.atlassian.com/bitbucket/ssh-keys-935365775.html)

### Q: Are HTTP(S) remotes preferred over SSH?

No, neither are "preferred". SSH isn't going away, and is supported "natively" in Git.

### Q: Why did you not just port the existing GCM Windows codebase from .NET Framework to .NET Core?

GCM Windows was not designed with a cross-platform architecture.

### What level of support does GCM Core have?

Support will be best-effort. We would really appreciate your feedback to make this a great experience across each platform we support. 

### Q: Why does GCM Core not support operating system/distribution 'X', or Git hosting provider 'Y'?

The likely answer is we haven't gotten around to that yet! 🙂

We are working on ensuring support for the Windows, macOS, and Ubuntu operating system, as well as the following Git hosting providers: Azure Repos, Azure DevOps Server (TFS), GitHub, and Bitbucket.

We are happy to accept proposals and/or contributions to enable GCM Core to run on other platforms and Git host providers. Thank you!
