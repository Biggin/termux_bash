// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
using System.IO;
using System.Text;

namespace Microsoft.Git.CredentialManager.Tests.Objects
{
    public class TestStandardStreams : IStandardStreams
    {
        public string NewLine { get; set; } = "\n";
        public string In { get; set; } = string.Empty;
        public StringBuilder Out { get; set; } = new StringBuilder();
        public StringBuilder Error { get; set; } = new StringBuilder();

        #region IStandardStreams

        TextReader IStandardStreams.In => new StringReader(In);

        TextWriter IStandardStreams.Out => new StringWriter(Out){NewLine = NewLine};

        TextWriter IStandardStreams.Error => new StringWriter(Error){NewLine = NewLine};

        #endregion
    }
}
