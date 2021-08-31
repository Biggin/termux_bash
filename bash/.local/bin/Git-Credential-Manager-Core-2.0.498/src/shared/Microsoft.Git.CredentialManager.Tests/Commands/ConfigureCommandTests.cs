// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
using System.Threading.Tasks;
using Microsoft.Git.CredentialManager.Commands;
using Microsoft.Git.CredentialManager.Tests.Objects;
using Moq;
using Xunit;

namespace Microsoft.Git.CredentialManager.Tests.Commands
{
    public class ConfigureCommandTests
    {
        [Fact]
        public async Task ConfigureCommand_ExecuteAsync_User_InvokesConfigurationServiceConfigureUser()
        {
            var configService = new Mock<IConfigurationService>();
            configService.Setup(x => x.ConfigureAsync(It.IsAny<ConfigurationTarget>()))
                .Returns(Task.CompletedTask)
                .Verifiable();

            var context = new TestCommandContext();
            var command = new ConfigureCommand(context, configService.Object);

            await command.ExecuteAsync(false);

            configService.Verify(x => x.ConfigureAsync(ConfigurationTarget.User), Times.Once);
        }

        [Fact]
        public async Task ConfigureCommand_ExecuteAsync_System_InvokesConfigurationServiceConfigureSystem()
        {
            var configService = new Mock<IConfigurationService>();
            configService.Setup(x => x.ConfigureAsync(It.IsAny<ConfigurationTarget>()))
                .Returns(Task.CompletedTask)
                .Verifiable();

            var context = new TestCommandContext();
            var command = new ConfigureCommand(context, configService.Object);

            await command.ExecuteAsync(true);

            configService.Verify(x => x.ConfigureAsync(ConfigurationTarget.System), Times.Once);
        }
    }
}
