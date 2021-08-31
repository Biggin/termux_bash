﻿using System.ComponentModel;
using System.Windows;
using System.Windows.Controls;

namespace Microsoft.Git.CredentialManager.UI.Controls
{
    public class PromptTextBox : TextBox
    {
        public static readonly DependencyProperty IconContentProperty = 
            DependencyProperty.RegisterAttached(nameof(IconContent), typeof(object), typeof(PromptTextBox));
        public static readonly DependencyProperty IconContentTemplateProperty =
            DependencyProperty.RegisterAttached(nameof(IconContentTemplate), typeof(DataTemplate), typeof(PromptTextBox));
        public static readonly DependencyProperty PromptTextProperty =
            DependencyProperty.Register(nameof(PromptText), typeof(string), typeof(PromptTextBox), new UIPropertyMetadata(""));

        public object IconContent
        {
            get { return GetValue(IconContentProperty); }
            set { SetValue(IconContentProperty, value); }
        }

        public object IconContentTemplate
        {
            get { return GetValue(IconContentTemplateProperty); }
            set { SetValue(IconContentTemplateProperty, value); }
        }

        [Localizability(LocalizationCategory.Text)]
        [DefaultValue("")]
        public string PromptText
        {
            get { return (string)GetValue(PromptTextProperty); }
            set { SetValue(PromptTextProperty, value); }
        }
    }
}
