-- scaffold geniefile for fcpp

fcpp_script = path.getabsolute(path.getdirectory(_SCRIPT))
fcpp_root = path.join(fcpp_script, "fcpp")

fcpp_includedirs = {
	path.join(fcpp_script, "config"),
	fcpp_root,
}

fcpp_libdirs = {}
fcpp_links = {}
fcpp_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { fcpp_includedirs }
	end,

	_add_defines = function()
		defines { fcpp_defines }
	end,

	_add_libdirs = function()
		libdirs { fcpp_libdirs }
	end,

	_add_external_links = function()
		links { fcpp_links }
	end,

	_add_self_links = function()
		links { "fcpp" }
	end,

	_create_projects = function()

project "fcpp"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		fcpp_includedirs,
	}

	defines {}

	files {
		path.join(fcpp_script, "config", "**.h"),
		path.join(fcpp_root, "**.h"),
		path.join(fcpp_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
