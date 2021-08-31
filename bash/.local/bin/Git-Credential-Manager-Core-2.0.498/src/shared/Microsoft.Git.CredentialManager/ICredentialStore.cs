// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.

namespace Microsoft.Git.CredentialManager
{
    /// <summary>
    /// Represents a secure storage location for <see cref="ICredential"/>s.
    /// </summary>
    public interface ICredentialStore
    {
        /// <summary>
        /// Get the first credential from the store that matches the given query.
        /// </summary>
        /// <param name="service">Name of the service to match against. Use null to match all values.</param>
        /// <param name="account">Account name to match against. Use null to match all values.</param>
        /// <returns>First matching credential or null if none are found.</returns>
        ICredential Get(string service, string account);

        /// <summary>
        /// Add or update credential in the store with the specified key.
        /// </summary>
        /// <param name="service">Name of the service this credential is for. Use null to match all values.</param>
        /// <param name="account">Account associated with this credential. Use null to match all values.</param>
        /// <param name="secret">Secret value to store.</param>
        void AddOrUpdate(string service, string account, string secret);

        /// <summary>
        /// Delete credential from the store that matches the given query.
        /// </summary>
        /// <param name="service">Name of the service to match against. Use null to match all values.</param>
        /// <param name="account">Account name to match against. Use null to match all values.</param>
        /// <returns>True if the credential was deleted, false otherwise.</returns>
        bool Remove(string service, string account);
    }
}
