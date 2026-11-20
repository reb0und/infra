# @TODO: Create way to declare color theme, extension configuration, set default search engine
{ pkgs, config, home, inputs, ... }:

{
	xdg = {
		configFile."mimeapps.list".force = true;

		mimeApps = {
			enable = true;
			
			defaultApplications = {
				"text/html" = "zen.desktop";
				"x-scheme-handler/http" = "zen.desktop";
  				"x-scheme-handler/https" = "zen.desktop";
  				"x-scheme-handler/about" = "zen.desktop";
  				"x-scheme-handler/unknown" = "zen.desktop";
   				"x-scheme-handler/chrome" = "zen.desktop";
   				"application/x-extension-htm" = "zen.desktop";
   				"application/x-extension-html" = "zen.desktop";
   				"application/x-extension-shtml" = "zen.desktop";
   				"application/xhtml+xml" = "zen.desktop";
				"application/x-extension-xhtml" = "zen.desktop";
				"application/x-extension-xht" = "zen.desktop";
			};
		};
	};

	imports = [ inputs.zen-browser.homeModules.beta ];

	programs.zen-browser = {
		enable = true;
		policies = {
			AutofillAddressEnabled = false;
			AutofillCreditCardEnabled = false;
			DisableAppUpdate = true;
			DisableFeedbackCommands = true;
			DisableFirefoxStudies = true;
			DisablePocket = true;
			DisableTelemetry = true;
			DontCheckDefaultBrowser = true;
			NoDefaultBookmarks = true;
			OfferToSaveLogins = false;
			EnableTrackingProtection = {
			      Value = true;
			      Locked = true;
			      Cryptomining = true;
			      Fingerprinting = true;
				# @TODO: Add extensions
			};
		};
	};
}
