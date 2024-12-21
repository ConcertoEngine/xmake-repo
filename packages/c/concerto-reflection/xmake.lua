package("concerto-reflection")
    set_homepage("git@github.com:ConcertoEngine/ConcertoReflection")
    set_description("Concerto reflection system for C++")
    set_license("MIT")
    set_kind("library")
    add_urls("git@github.com:ConcertoEngine/ConcertoReflection.git")

    add_versions("2024.12.21+5", "a588724599f4c231ba68a31d01d7af185093aa13")
    add_deps("concerto-core", "pugixml", "eventpp", "catch2")

    on_install(function (package)
        import("package.tools.xmake").install(package, configs)
    end)
