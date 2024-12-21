package("concerto-reflection")
    set_homepage("git@github.com:ConcertoEngine/ConcertoReflection")
    set_description("Concerto reflection system for C++")
    set_license("MIT")
    set_kind("library")
    add_urls("git@github.com:ConcertoEngine/ConcertoReflection.git")

    add_versions("2024.12.21", "6e5c2fa26269169fa1e766d056c722d1363a7363")
    add_deps("concerto-core", "pugixml", "eventpp", "catch2")

    on_install(function (package)
        import("package.tools.xmake").install(package, configs)
    end)
