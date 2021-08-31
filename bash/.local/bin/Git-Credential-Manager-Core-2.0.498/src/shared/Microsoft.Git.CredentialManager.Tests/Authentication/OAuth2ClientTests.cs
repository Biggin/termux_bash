// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
using System;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Git.CredentialManager.Authentication.OAuth;
using Microsoft.Git.CredentialManager.Tests.Objects;
using Xunit;

namespace Microsoft.Git.CredentialManager.Tests.Authentication
{
    public class OAuth2ClientTests
    {
        private const string TestClientId = "9ffe7f11c8";
        private const string TestClientSecret = "62adac63a4614d93833470942a38454f"; // [SuppressMessage("Microsoft.Security", "CS001:SecretInline", Justification="Fake credential")]
        private static readonly Uri TestRedirectUri = new Uri("http://localhost/oauth-callback");

        [Fact]
        public async Task OAuth2Client_GetAuthorizationCodeAsync()
        {
            const string expectedAuthCode = "68c39cbd8d";

            var baseUri = new Uri("https://example.com");
            OAuth2ServerEndpoints endpoints = CreateEndpoints(baseUri);

            var httpHandler = new TestHttpMessageHandler {ThrowOnUnexpectedRequest = true};

            string[] expectedScopes = {"read", "write", "delete"};

            OAuth2Application app = CreateTestApplication();

            var server = new TestOAuth2Server(endpoints);
            server.RegisterApplication(app);
            server.Bind(httpHandler);
            server.TokenGenerator.AuthCodes.Add(expectedAuthCode);

            IOAuth2WebBrowser browser = new TestOAuth2WebBrowser(httpHandler);

            OAuth2Client client = CreateClient(httpHandler, endpoints);

            OAuth2AuthorizationCodeResult result = await client.GetAuthorizationCodeAsync(expectedScopes, browser, CancellationToken.None);

            Assert.Equal(expectedAuthCode, result.Code);
        }

        [Fact]
        public async Task OAuth2Client_GetDeviceCodeAsync()
        {
            const string expectedUserCode = "254583";
            const string expectedDeviceCode = "6d1e34151aff4f41b9f186e177a0b15d";

            var baseUri = new Uri("https://example.com");
            OAuth2ServerEndpoints endpoints = CreateEndpoints(baseUri);

            var httpHandler = new TestHttpMessageHandler {ThrowOnUnexpectedRequest = true};

            string[] expectedScopes = {"read", "write", "delete"};

            OAuth2Application app = CreateTestApplication();

            var server = new TestOAuth2Server(endpoints);
            server.RegisterApplication(app);
            server.Bind(httpHandler);
            server.TokenGenerator.UserCodes.Add(expectedUserCode);
            server.TokenGenerator.DeviceCodes.Add(expectedDeviceCode);

            OAuth2Client client = CreateClient(httpHandler, endpoints);

            OAuth2DeviceCodeResult result = await client.GetDeviceCodeAsync(expectedScopes, CancellationToken.None);

            Assert.Equal(expectedUserCode, result.UserCode);
            Assert.Equal(expectedDeviceCode, result.DeviceCode);
        }

        [Fact]
        public async Task OAuth2Client_GetTokenByAuthorizationCodeAsync()
        {
            const string authCode = "a63ef59691";
            const string expectedAccessToken = "LET_ME_IN";
            const string expectedRefreshToken = "REFRESH_ME";

            var baseUri = new Uri("https://example.com");
            OAuth2ServerEndpoints endpoints = CreateEndpoints(baseUri);

            var httpHandler = new TestHttpMessageHandler {ThrowOnUnexpectedRequest = true};

            string[] expectedScopes = {"read", "write", "delete"};

            OAuth2Application app = CreateTestApplication();
            app.AuthGrants.Add(new OAuth2Application.AuthCodeGrant(authCode, expectedScopes));

            var server = new TestOAuth2Server(endpoints);
            server.RegisterApplication(app);
            server.Bind(httpHandler);
            server.TokenGenerator.AccessTokens.Add(expectedAccessToken);
            server.TokenGenerator.RefreshTokens.Add(expectedRefreshToken);

            OAuth2Client client = CreateClient(httpHandler, endpoints);

            var authCodeResult = new OAuth2AuthorizationCodeResult(authCode, TestRedirectUri);
            OAuth2TokenResult result = await client.GetTokenByAuthorizationCodeAsync(authCodeResult, CancellationToken.None);

            Assert.NotNull(result);
            Assert.Equal(expectedScopes, result.Scopes);
            Assert.Equal(expectedAccessToken, result.AccessToken);
            Assert.Equal(expectedRefreshToken, result.RefreshToken);
        }

        [Fact]
        public async Task OAuth2Client_GetTokenByRefreshTokenAsync()
        {
            const string oldAccessToken = "OLD_LET_ME_IN";
            const string oldRefreshToken = "OLD_REFRESH_ME";
            const string expectedAccessToken = "NEW_LET_ME_IN";
            const string expectedRefreshToken = "NEW_REFRESH_ME";

            var baseUri = new Uri("https://example.com");
            OAuth2ServerEndpoints endpoints = CreateEndpoints(baseUri);

            var httpHandler = new TestHttpMessageHandler {ThrowOnUnexpectedRequest = true};

            string[] expectedScopes = {"read", "write", "delete"};

            // Setup an existing access and refresh token
            OAuth2Application app = CreateTestApplication();
            app.AccessTokens[oldAccessToken] = oldRefreshToken;
            app.RefreshTokens[oldRefreshToken] = expectedScopes;

            var server = new TestOAuth2Server(endpoints);
            server.RegisterApplication(app);
            server.Bind(httpHandler);
            server.TokenGenerator.AccessTokens.Add(expectedAccessToken);
            server.TokenGenerator.RefreshTokens.Add(expectedRefreshToken);

            OAuth2Client client = CreateClient(httpHandler, endpoints);

            OAuth2TokenResult result = await client.GetTokenByRefreshTokenAsync(oldRefreshToken, CancellationToken.None);

            Assert.NotNull(result);
            Assert.Equal(expectedScopes, result.Scopes);
            Assert.Equal(expectedAccessToken, result.AccessToken);
            Assert.Equal(expectedRefreshToken, result.RefreshToken);
        }

        [Fact]
        public async Task OAuth2Client_GetTokenByDeviceCodeAsync()
        {
            const string expectedUserCode = "342728";
            const string expectedDeviceCode = "ad6498533bf54f4db53e49612a4acfb0";
            const string expectedAccessToken = "LET_ME_IN";
            const string expectedRefreshToken = "REFRESH_ME";

            var baseUri = new Uri("https://example.com");
            OAuth2ServerEndpoints endpoints = CreateEndpoints(baseUri);

            var httpHandler = new TestHttpMessageHandler {ThrowOnUnexpectedRequest = true};

            string[] expectedScopes = {"read", "write", "delete"};

            var grant = new OAuth2Application.DeviceCodeGrant(expectedUserCode, expectedDeviceCode, expectedScopes);

            OAuth2Application app = CreateTestApplication();
            app.DeviceGrants.Add(grant);

            var server = new TestOAuth2Server(endpoints);
            server.RegisterApplication(app);
            server.Bind(httpHandler);
            server.TokenGenerator.UserCodes.Add(expectedUserCode);
            server.TokenGenerator.DeviceCodes.Add(expectedDeviceCode);
            server.TokenGenerator.AccessTokens.Add(expectedAccessToken);
            server.TokenGenerator.RefreshTokens.Add(expectedRefreshToken);

            OAuth2Client client = CreateClient(httpHandler, endpoints);

            var deviceCodeResult = new OAuth2DeviceCodeResult(expectedDeviceCode, expectedUserCode, null, null);

            Task<OAuth2TokenResult> resultTask = client.GetTokenByDeviceCodeAsync(deviceCodeResult, CancellationToken.None);

            // Simulate the user taking some time to sign in with the user code
            Thread.Sleep(1000);
            server.SignInDeviceWithUserCode(expectedUserCode);

            OAuth2TokenResult result = await resultTask;

            Assert.NotNull(result);
            Assert.Equal(expectedScopes, result.Scopes);
            Assert.Equal(expectedAccessToken, result.AccessToken);
            Assert.Equal(expectedRefreshToken, result.RefreshToken);
        }

        [Fact]
        public async Task OAuth2Client_E2E_InteractiveWebFlowAndRefresh()
        {
            const string expectedAuthCode = "e78a711d11";
            const string expectedAccessToken1 = "LET_ME_IN-1";
            const string expectedAccessToken2 = "LET_ME_IN-2";
            const string expectedRefreshToken1 = "REFRESH_ME-1";
            const string expectedRefreshToken2 = "REFRESH_ME-2";

            var baseUri = new Uri("https://example.com");
            OAuth2ServerEndpoints endpoints = CreateEndpoints(baseUri);

            var httpHandler = new TestHttpMessageHandler {ThrowOnUnexpectedRequest = true};

            string[] expectedScopes = {"read", "write", "delete"};

            OAuth2Application app = CreateTestApplication();

            var server = new TestOAuth2Server(endpoints);
            server.RegisterApplication(app);
            server.Bind(httpHandler);
            server.TokenGenerator.AuthCodes.Add(expectedAuthCode);
            server.TokenGenerator.AccessTokens.Add(expectedAccessToken1);
            server.TokenGenerator.RefreshTokens.Add(expectedRefreshToken1);

            IOAuth2WebBrowser browser = new TestOAuth2WebBrowser(httpHandler);

            OAuth2Client client = CreateClient(httpHandler, endpoints);

            OAuth2AuthorizationCodeResult authCodeResult = await client.GetAuthorizationCodeAsync(
                expectedScopes, browser, CancellationToken.None);

            OAuth2TokenResult result1 = await client.GetTokenByAuthorizationCodeAsync(authCodeResult, CancellationToken.None);

            Assert.NotNull(result1);
            Assert.Equal(expectedScopes, result1.Scopes);
            Assert.Equal(expectedAccessToken1, result1.AccessToken);
            Assert.Equal(expectedRefreshToken1, result1.RefreshToken);

            server.TokenGenerator.AccessTokens.Add(expectedAccessToken2);
            server.TokenGenerator.RefreshTokens.Add(expectedRefreshToken2);

            OAuth2TokenResult result2 = await client.GetTokenByRefreshTokenAsync(result1.RefreshToken, CancellationToken.None);
            Assert.NotNull(result2);
            Assert.Equal(expectedScopes, result2.Scopes);
            Assert.Equal(expectedAccessToken2, result2.AccessToken);
            Assert.Equal(expectedRefreshToken2, result2.RefreshToken);
        }

        [Fact]
        public async Task OAuth2Client_E2E_DeviceFlowAndRefresh()
        {
            const string expectedUserCode = "736998";
            const string expectedDeviceCode = "db6558b2a1d649758394ac3c2d9e00b1";
            const string expectedAccessToken1 = "LET_ME_IN-1";
            const string expectedAccessToken2 = "LET_ME_IN-2";
            const string expectedRefreshToken1 = "REFRESH_ME-1";
            const string expectedRefreshToken2 = "REFRESH_ME-2";

            var baseUri = new Uri("https://example.com");
            OAuth2ServerEndpoints endpoints = CreateEndpoints(baseUri);

            var httpHandler = new TestHttpMessageHandler {ThrowOnUnexpectedRequest = true};

            string[] expectedScopes = {"read", "write", "delete"};

            OAuth2Application app = CreateTestApplication();

            var server = new TestOAuth2Server(endpoints);
            server.RegisterApplication(app);
            server.Bind(httpHandler);
            server.TokenGenerator.UserCodes.Add(expectedUserCode);
            server.TokenGenerator.DeviceCodes.Add(expectedDeviceCode);
            server.TokenGenerator.AccessTokens.Add(expectedAccessToken1);
            server.TokenGenerator.RefreshTokens.Add(expectedRefreshToken1);

            OAuth2Client client = CreateClient(httpHandler, endpoints);

            OAuth2DeviceCodeResult deviceResult = await client.GetDeviceCodeAsync(expectedScopes, CancellationToken.None);

            // Simulate the user taking some time to sign in with the user code
            Thread.Sleep(1000);
            server.SignInDeviceWithUserCode(deviceResult.UserCode);

            OAuth2TokenResult result1 = await client.GetTokenByDeviceCodeAsync(deviceResult, CancellationToken.None);

            Assert.NotNull(result1);
            Assert.Equal(expectedScopes, result1.Scopes);
            Assert.Equal(expectedAccessToken1, result1.AccessToken);
            Assert.Equal(expectedRefreshToken1, result1.RefreshToken);

            server.TokenGenerator.AccessTokens.Add(expectedAccessToken2);
            server.TokenGenerator.RefreshTokens.Add(expectedRefreshToken2);

            OAuth2TokenResult result2 = await client.GetTokenByRefreshTokenAsync(result1.RefreshToken, CancellationToken.None);
            Assert.NotNull(result2);
            Assert.Equal(expectedScopes, result2.Scopes);
            Assert.Equal(expectedAccessToken2, result2.AccessToken);
            Assert.Equal(expectedRefreshToken2, result2.RefreshToken);
        }

        #region Helpers

        private static OAuth2Application CreateTestApplication() => new OAuth2Application(TestClientId)
        {
            Secret = TestClientSecret,
            RedirectUris = new[] {TestRedirectUri}
        };

        private static OAuth2Client CreateClient(HttpMessageHandler httpHandler, OAuth2ServerEndpoints endpoints, IOAuth2CodeGenerator generator = null)
        {
            return new OAuth2Client(new HttpClient(httpHandler), endpoints, TestClientId, TestRedirectUri, TestClientSecret)
            {
                CodeGenerator = generator
            };
        }

        private static OAuth2ServerEndpoints CreateEndpoints(Uri baseUri)
        {
            Uri authEndpoint = new Uri(baseUri, "/oauth/v2.0/authorize");
            Uri tokenEndpoint = new Uri(baseUri, "/oauth/v2.0/access_token");
            Uri deviceEndpoint = new Uri(baseUri, "/oauth/v2.0/authorize_device");

            return new OAuth2ServerEndpoints(authEndpoint, tokenEndpoint)
                {DeviceAuthorizationEndpoint = deviceEndpoint};
        }

        #endregion
    }
}
