// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
using System.CommandLine;
using System.CommandLine.Invocation;
using System.Threading.Tasks;

namespace Microsoft.Git.CredentialManager.Commands
{
    public abstract class ConfigurationCommandBase : Command
    {
        protected ConfigurationCommandBase(ICommandContext context, string name, string description, IConfigurationService configurationService)
            : base(name, description)
        {
            EnsureArgument.NotNull(context, nameof(context));
            EnsureArgument.NotNull(configurationService, nameof(configurationService));

            Context = context;
            ConfigurationService = configurationService;

            AddOption(new Option<bool>("--system", "Modify the system-wide Git configuration instead of the current user"));

            Handler = CommandHandler.Create<bool>(ExecuteAsync);
        }

        protected ICommandContext Context { get; }

        protected IConfigurationService ConfigurationService { get; }

        internal Task ExecuteAsync(bool system)
        {
            var target = system
                ? ConfigurationTarget.System
                : ConfigurationTarget.User;

            return ExecuteInternalAsync(target);
        }

        protected abstract Task ExecuteInternalAsync(ConfigurationTarget target);
    }

    public class ConfigureCommand : ConfigurationCommandBase
    {
        public ConfigureCommand(ICommandContext context, IConfigurationService configurationService)
            : base(context, "configure", "Configure Git Credential Manager as the Git credential helper", configurationService) { }

        protected override Task ExecuteInternalAsync(ConfigurationTarget target)
        {
            return ConfigurationService.ConfigureAsync(target);
        }
    }

    public class UnconfigureCommand : ConfigurationCommandBase
    {
        public UnconfigureCommand(ICommandContext context, IConfigurationService configurationService)
            : base(context, "unconfigure", "Unconfigure Git Credential Manager as the Git credential helper", configurationService) { }

        protected override Task ExecuteInternalAsync(ConfigurationTarget target)
        {
            return ConfigurationService.UnconfigureAsync(target);
        }
    }
}
