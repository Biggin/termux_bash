// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

namespace Microsoft.Git.CredentialManager.Tests.Objects
{
    public class TestGit : IGit
    {
        public string CurrentRepository { get; set; }

        public IList<GitRemote> Remotes { get; set; } = new List<GitRemote>();

        public readonly TestGitConfiguration Configuration = new TestGitConfiguration();

        public TestGit(bool insideRepo = true)
        {
            if (insideRepo)
            {
                CurrentRepository = GetFakeRepositoryPath();
            }
        }

        #region IGit

        string IGit.GetCurrentRepository() => CurrentRepository;

        IEnumerable<GitRemote> IGit.GetRemotes() => Remotes;

        IGitConfiguration IGit.GetConfiguration() => Configuration;

        Task<IDictionary<string, string>> IGit.InvokeHelperAsync(string args, IDictionary<string, string> standardInput)
        {
            throw new NotImplementedException();
        }

        #endregion

        private static IDictionary<string, IList<string>> MergeDictionaries(params IDictionary<string, IList<string>>[] dictionaries)
        {
            var result = new Dictionary<string, IList<string>>(GitConfigurationKeyComparer.Instance);

            foreach (IDictionary<string, IList<string>> dict in dictionaries)
            {
                foreach (var kvp in dict)
                {
                    result[kvp.Key] = kvp.Value;
                }
            }

            return result;
        }

        public static string GetFakeRepositoryPath(string name = null)
        {
            name ??= Guid.NewGuid().ToString("N").Substring(8);
            var basePath = Path.GetTempPath();
            return Path.Combine(basePath, "fake-repo", name);
        }
    }
}
