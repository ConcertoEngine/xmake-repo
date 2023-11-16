package('Concerto')
    set_homepage('https://github.com/ConcertoEngine/Concerto')
    set_description('Concerto engine')
    set_license('MIT')
    set_kind('library')
    add_urls('https://github.com/ConcertoEngine/Concerto.git')
    add_versions('2023.16.11+3', 'a70b469e3e1f4a4c4a6a509255e3b07ee905d8a6')

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)
