﻿using System.Diagnostics;
using System.Windows.Input;
using Microsoft.Git.CredentialManager;
using Microsoft.Git.CredentialManager.UI;
using Microsoft.Git.CredentialManager.UI.ViewModels;

namespace GitHub.UI.Login
{
    public class Login2FaViewModel : WindowViewModel
    {
        private TwoFactorType twoFactorType;
        private string description;
        private string authenticationCode;
        private bool isSms;

        public Login2FaViewModel(TwoFactorType twoFactorType)
        {
            TwoFactorType = twoFactorType;

            VerifyCommand = new RelayCommand(Verify, CanVerify);
            NavigateLearnMoreCommand = new RelayCommand(NavigateLearnMore);
        }

        public override bool IsValid => CanVerify();

        public override string Title => GitHubResources.TwoFactorTitle;

        public TwoFactorType TwoFactorType
        {
            get => this.twoFactorType;
            private set
            {
                SetAndRaisePropertyChanged(ref this.twoFactorType, value);
                switch (value)
                {
                    case TwoFactorType.Sms:
                        Description = GitHubResources.TwoFactorSms;
                        IsSms = true;
                        break;
                    case TwoFactorType.AuthenticatorApp:
                        Description = GitHubResources.TwoFactorApp;
                        IsSms = false;
                        break;
                    case TwoFactorType.Unknown:
                    default:
                        Description = GitHubResources.TwoFactorUnknown;
                        IsSms = false;
                        break;
                }
            }
        }

        public string Description
        {
            get => this.description;
            private set => SetAndRaisePropertyChanged(ref this.description, value);
        }

        public string AuthenticationCode
        {
            get => this.authenticationCode;
            set
            {
                SetAndRaisePropertyChanged(ref this.authenticationCode, value);
                VerifyCommand.RaiseCanExecuteChanged();
            }
        }

        public bool IsSms
        {
            get => this.isSms;
            private set => SetAndRaisePropertyChanged(ref this.isSms, value);
        }

        public RelayCommand VerifyCommand { get; }

        private bool CanVerify()
        {
            return AuthenticationCode?.Length == 6;
        }

        public ICommand NavigateLearnMoreCommand { get; }

        private void Verify()
        {
            Accept();
        }

        private void NavigateLearnMore()
        {
            OpenDefaultBrowser(NavigateLearnMoreUrl);
        }

        public string NavigateLearnMoreUrl => "https://aka.ms/vs-core-github-auth-help";
    }
}
