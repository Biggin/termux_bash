// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
using System.Runtime.InteropServices;

namespace Microsoft.Git.CredentialManager.Interop.Posix.Native
{
    public static class Signal
    {
        /// <summary>
        /// Interrupt.
        /// </summary>
        public const int SIGINT  = 2;

        /// <summary>
        /// Quit.
        /// </summary>
        public const int SIGQUIT = 3;

        /// <summary>
        /// Abort.
        /// </summary>
        public const int SIGABRT = 6;

        /// <summary>
        /// Kill (cannot be caught or ignored).
        /// </summary>
        public const int SIGKILL = 9;

        /// <summary>
        /// Software termination signal from kill.
        /// </summary>
        public const int SIGTERM = 15;

        [DllImport("libc", CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Ansi)]
        public static extern void kill(int pid, int sig);
    }
}
