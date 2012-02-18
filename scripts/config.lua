Setup.Package
{
 	vendor = "liflg.org",
 	id = "rt2",
 	description = "Railroad Tycoon 2",
 	version = "1.54c-english",
 	splash = "splash.png",
 	superuser = false,
	write_manifest = true,
 	support_uninstall = true,
 	recommended_destinations =
 	{
 		"/usr/local/games",
		"/opt",
		MojoSetup.info.homedir,
 	},

 	Setup.Readme
 	{
 		description = "README",
 		source = "README.liflg"
 	},

	Setup.Media
 	{
 		id = "rt2-disc",
		description = "Railroad Tycoon 2 Loki disc",
		uniquefile = "bin/x86/rt2"	
 	},

	Setup.Option {
		required = true,
		description = "Files for Railroad Tycoon 2",
		bytes = 359650620,
                Setup.DesktopMenuItem
                {
                	disabled = false,
			name = "Railroad Tycoon 2",
                        genericname = "Railroad Tycoon 2",
                        tooltip = "Play Railroad Tycoon 2",
                        builtin_icon = false,
                        icon = "icon.xpm",
                        commandline = "%0/rt2.sh",
                        category = "Game",
                },
		
		Setup.File {
			source = "media://rt2-disc/bin/x86/",
			permissions = "755",
		},

		Setup.File {
			source = "media://rt2-disc/main.tar.gz",
			allowoverwrite = true,
		},

		Setup.File {
			source = "media://rt2-disc/maps.tar.gz",
			allowoverwrite = true,
		},

		Setup.File {
			allowoverwrite = true,
			source = "media://rt2-disc/",
			wildcards = {"icon.bmp", "splash.bmp", "README", "Manual/*", "maps/*", "anim/*"},
		},

		Setup.File 
		{
			wildcards =  "rt2.sh",
			permissions = "0755",
		},

		Setup.File
		{	
			wildcards = { "README.liflg", "userprofile.txt" },
		},

		Setup.Option {
			value = true,
			required = true,
			description = "Apply Patch 1.54c",
			tooltip = "Latest update from Loki",
			bytes = 16909051,
			Setup.File{
				allowoverwrite = true,
				source = "base:///patch-1.54c.tar/",
				filter = function(dest)
					if ( string.match( dest, "rt2" ) ) then
						return dest, "0755"
					end
					return dest
				end
			},

			Setup.File{
				wildcards = "rt2.dynamic.sh",
				permissions = "0755",
			},

			Setup.OptionGroup{
				description = "Choose language",
				Setup.Option{
					value = true,
					description = "English",
					bytes = 164704,
					Setup.File{
						allowoverwrite = true,
						source = "base:///english.tar/",
					},
				},

				Setup.Option{
					value = false,
					description = "German",
					bytes = 147583,
					Setup.File{
						allowoverwrite = true,
						source = "base:///german.tar/",
					},
				},
			},
		},
	},
}			
