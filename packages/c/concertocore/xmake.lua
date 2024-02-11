package('ConcertoCore')
    set_homepage('https://github.com/ConcertoEngine/ConcertoCore')
    set_description('Concerto engine core library')
    set_license('MIT')
    set_kind('library')
    add_urls('https://github.com/ConcertoEngine/ConcertoCore.git')
    add_versions('2024.02.11', '4c857483ef293527c9a30af564dcffaae04cec1e')
    add_deps("nlohmann_json")

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)
