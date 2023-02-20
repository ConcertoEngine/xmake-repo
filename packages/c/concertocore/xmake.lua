package('ConcertoCore')
    set_homepage('https://github.com/ConcertoEngine/ConcertoCore')
    set_description('Concerto engine core library')
    set_license('MIT')
    set_kind('library')
    add_urls('https://github.com/ConcertoEngine/ConcertoCore.git')
    add_versions('2023.02.20', 'a2fbe5f7e411eff90f68661aaf0a4e87a3fd5386')

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)