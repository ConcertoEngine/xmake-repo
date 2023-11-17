package('ConcertoCore')
    set_homepage('https://github.com/ConcertoEngine/ConcertoCore')
    set_description('Concerto engine core library')
    set_license('MIT')
    set_kind('library')
    add_urls('https://github.com/ConcertoEngine/ConcertoCore.git')
    add_versions('2023.11.17+3', 'fe8a6926debe40628475673a79fa741832a7d718')
    add_deps("nlohmann_json")

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)
