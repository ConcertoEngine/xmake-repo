package("concerto-reflection")
    set_homepage("git@github.com:ConcertoEngine/ConcertoReflection")
    set_description("Concerto reflection system for C++")
    set_license("MIT")
    set_kind("library")
    add_urls("git@github.com:ConcertoEngine/ConcertoReflection.git")

    add_versions("2024.12.20+1", "2a3c689541580ff35aa13c91c1bf88b671289ffc")
    add_deps("concerto-core", "pugixml", "eventpp", "catch2")

    on_install(function (package)
        import("package.tools.xmake").install(package, configs)
    end)
