// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
using System;

namespace Microsoft.Git.CredentialManager
{
    public static class ConvertUtils
    {
        public static bool TryToInt32(object value, out int i)
        {
            return TryConvert(Convert.ToInt32, value, out i);
        }

        public static bool TryConvert<T>(Func<object, T> convert, object value, out T @out)
        {
            try
            {
                @out = convert(value);
                return true;
            }
            catch
            {
                @out = default(T);
                return false;
            }
        }
    }
}
