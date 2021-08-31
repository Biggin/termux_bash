// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;

namespace Microsoft.Git.CredentialManager
{
    /// <summary>
    /// Constructs <see cref="HttpClient"/>s that have been configured for use in Git Credential Manager.
    /// </summary>
    public interface IHttpClientFactory
    {
        /// <summary>
        /// Get a new instance of <see cref="HttpClient"/> with default request headers set.
        /// </summary>
        /// <remarks>
        /// Callers should reuse instances of <see cref="HttpClient"/> returned from this method as long
        /// as they are needed, rather than repeatably call this method to create new ones.
        /// <para/>
        /// Creating a new <see cref="HttpClient"/> consumes one free socket which may not be released
        /// by the Operating System until sometime after the client is disposed, leading to possible free
        /// socket exhaustion.
        /// <para/>
        /// The client instance is configured for use behind a proxy using Git's http.proxy configuration
        /// for the local repository (the current working directory), if found.
        /// </remarks>
        /// <returns>New client instance with default headers.</returns>
        HttpClient CreateClient();
    }

    public class HttpClientFactory : IHttpClientFactory
    {
        private readonly ITrace _trace;
        private readonly ISettings _settings;
        private readonly IStandardStreams _streams;

        public HttpClientFactory(ITrace trace, ISettings settings, IStandardStreams streams)
        {
            EnsureArgument.NotNull(trace, nameof(trace));
            EnsureArgument.NotNull(settings, nameof(settings));
            EnsureArgument.NotNull(streams, nameof(streams));

            _trace = trace;
            _settings = settings;
            _streams = streams;
        }

        public HttpClient CreateClient()
        {
            _trace.WriteLine("Creating new HTTP client instance...");

            HttpClientHandler handler;

            if (TryCreateProxy(out IWebProxy proxy))
            {
                _trace.WriteLine("HTTP client is using the configured proxy.");

                handler = new HttpClientHandler
                {
                    Proxy = proxy,
                    UseProxy = true
                };
            }
            else
            {
                handler = new HttpClientHandler();
            }

            if (!_settings.IsCertificateVerificationEnabled)
            {
                _trace.WriteLine("TLS certificate verification has been disabled.");
                _streams.Error.WriteLine("warning: ----------------- SECURITY WARNING ----------------");
                _streams.Error.WriteLine("warning: | TLS certificate verification has been disabled! |");
                _streams.Error.WriteLine("warning: ---------------------------------------------------");
                _streams.Error.WriteLine($"warning: HTTPS connections may not be secure. See {Constants.HelpUrls.GcmTlsVerification} for more information.");

#if NETFRAMEWORK
                ServicePointManager.ServerCertificateValidationCallback = (req, cert, chain, errors) => true;
#elif NETSTANDARD
                handler.ServerCertificateCustomValidationCallback = (req, cert, chain, errors) => true;
#endif
            }

            var client = new HttpClient(handler);

            // Add default headers
            client.DefaultRequestHeaders.UserAgent.ParseAdd(Constants.GetHttpUserAgent());
            client.DefaultRequestHeaders.CacheControl = new CacheControlHeaderValue
            {
                NoCache = true
            };

            return client;
        }

        /// <summary>
        /// Try to create an <see cref="IWebProxy"/> object from the configuration specified by environment variables,
        /// or Git configuration for the specified repository, current user, and system.
        /// </summary>
        /// <param name="proxy">Configured <see cref="IWebProxy"/>, or null if no proxy configuration was found.</param>
        /// <returns>True if proxy configuration was found, false otherwise.</returns>
        public bool TryCreateProxy(out IWebProxy proxy)
        {
            // Try to extract the proxy URI from the environment or Git config
            ProxyConfiguration proxyConfig = _settings.GetProxyConfiguration();
            if (proxyConfig != null)
            {
                // Inform the user if they are using a deprecated proxy configuration
                if (proxyConfig.IsDeprecatedSource)
                {
                    _trace.WriteLine("Using a deprecated proxy configuration.");
                    _streams.Error.WriteLine($"warning: Using a deprecated proxy configuration. See {Constants.HelpUrls.GcmHttpProxyGuide} for more information.");
                }

                // Dictionary of proxy info for tracing
                var dict = new Dictionary<string, string> {["address"] = proxyConfig.Address.ToString()};
                if (proxyConfig.BypassHosts.Any()) dict["bypass"] = string.Join(",", proxyConfig.BypassHosts);

                // Try to configure proxy credentials.
                // For an empty username AND password we should use the system default credentials
                // (for example for Windows Integrated Authentication-based proxies).
                if (!(string.IsNullOrEmpty(proxyConfig.UserName) && string.IsNullOrEmpty(proxyConfig.Password)))
                {
                    proxy = new WebProxy(proxyConfig.Address)
                    {
                        Credentials = new NetworkCredential(proxyConfig.UserName, proxyConfig.Password),
                        BypassList = proxyConfig.BypassHosts.ToArray()
                    };

                    // Add user/pass info to the trace dictionary
                    dict["username"] = proxyConfig.UserName;
                    dict["password"] = proxyConfig.Password;
                }
                else
                {
                    proxy = new WebProxy(proxyConfig.Address)
                    {
                        UseDefaultCredentials = true,
                        BypassList = proxyConfig.BypassHosts.ToArray()
                    };

                    // Trace the use of system default credentials
                    dict["useDefaultCredentials"] = "true";
                }

                // Tracer out proxy info dictionary
                _trace.WriteLine("Created a WebProxy instance:");
                _trace.WriteDictionarySecrets(dict, new[] {"password"});

                return true;
            }

            proxy = null;
            return false;
        }
    }
}
