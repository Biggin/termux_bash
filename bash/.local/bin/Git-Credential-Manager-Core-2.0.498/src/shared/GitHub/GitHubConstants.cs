// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
using System;

namespace GitHub
{
    public static class GitHubConstants
    {
        public const string GitHubBaseUrlHost = "github.com";
        public const string GistBaseUrlHost = "gist." + GitHubBaseUrlHost;

        public const string DefaultAuthenticationHelper = "GitHub.UI";

        public const string OAuthClientId = "0120e057bd645470c1ed";

        // [SuppressMessage("Microsoft.Security", "CS002:SecretInNextLine", Justification="OAuth2 public client application 'secrets' are required and permitted to be public")]
        public const string OAuthClientSecret = "18867509d956965542b521a529a79bb883344c90";
        public static readonly Uri OAuthRedirectUri = new Uri("http://localhost/");
        public static readonly Uri OAuthAuthorizationEndpointRelativeUri = new Uri("/login/oauth/authorize", UriKind.Relative);
        public static readonly Uri OAuthTokenEndpointRelativeUri = new Uri("/login/oauth/access_token", UriKind.Relative);
        public static readonly Uri OAuthDeviceEndpointRelativeUri = new Uri("/login/device/code", UriKind.Relative);

        /// <summary>
        /// The GitHub required HTTP accepts header value
        /// </summary>
        public const string GitHubApiAcceptsHeaderValue = "application/vnd.github.v3+json";
        public const string GitHubOptHeader = "X-GitHub-OTP";

        /// <summary>
        /// Minimum GitHub Enterprise Server version that supports OAuth authentication with GCM Core.
        /// </summary>
        public static readonly Version MinimumOnPremOAuthVersion = new Version("3.2");

        /// <summary>
        /// The version string returned from the meta API endpoint for GitHub AE instances.
        /// </summary>
        public const string GitHubAeVersionString = "GitHub AE";

        /// <summary>
        /// Supported authentication modes for GitHub.com.
        /// </summary>
        /// <remarks>
        /// As of 13th November 2020, GitHub.com does not support username/password (basic) authentication to the APIs.
        /// See https://developer.github.com/changes/2020-02-14-deprecating-oauth-auth-endpoint for more information.
        /// </remarks>
        public const AuthenticationModes DotComAuthenticationModes = AuthenticationModes.OAuth | AuthenticationModes.Pat;

        public static class TokenScopes
        {
            public const string Gist = "gist";
            public const string Repo = "repo";
        }

        public static class OAuthScopes
        {
            public const string Gist = "gist";
            public const string Repo = "repo";
            public const string Workflow = "workflow";
        }

        public static class EnvironmentVariables
        {
            public const string AuthenticationHelper = "GCM_GITHUB_HELPER";
            public const string AuthenticationModes = "GCM_GITHUB_AUTHMODES";
            public const string DevOAuthClientId = "GCM_DEV_GITHUB_CLIENTID";
            public const string DevOAuthClientSecret = "GCM_DEV_GITHUB_CLIENTSECRET";
            public const string DevOAuthRedirectUri = "GCM_DEV_GITHUB_REDIRECTURI";
        }

        public static class GitConfiguration
        {
            public static class Credential
            {
                public const string AuthenticationHelper = "gitHubHelper";
                public const string AuthenticationModes = "gitHubAuthModes";
                public const string DevOAuthClientId = "gitHubDevClientId";
                public const string DevOAuthClientSecret = "gitHubDevClientSecret";
                public const string DevOAuthRedirectUri = "gitHubDevRedirectUri";
            }
        }
    }
}
