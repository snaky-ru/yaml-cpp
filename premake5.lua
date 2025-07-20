project "yaml-cpp"
	kind "StaticLib"
	language "C++"

	targetdir ("%{wks.location}/Binary/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/Intermediate/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp",
		
		"include/**.h"
	}

	includedirs
	{
		"include"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

  filter("system:macosx")
    systemversion("15.0")
    toolset("clang")
    architecture("arm64")

    buildoptions(
        {
            "-Wall",
            "-Wextra",
        }
    )

    links({
        "CoreFoundation.framework",
        "CoreGraphics.framework",
        "IOKit.framework",
        "AppKit.framework",
        "OpenGL.framework"
    })

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
