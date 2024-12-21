package("concerto-reflection")
    set_homepage("git@github.com:ConcertoEngine/ConcertoReflection")
    set_description("Concerto reflection system for C++")
    set_license("MIT")
    set_kind("library")
    add_urls("git@github.com:ConcertoEngine/ConcertoReflection.git")

    add_versions("2024.12.21+3", "2c06c88957cf632c42082c8596b15553b0d19b6c")
    add_deps("concerto-core", "pugixml", "eventpp", "catch2")

    on_install(function (package)
        import("package.tools.xmake").install(package, configs)
    end)
