package('ConcertoEngine')
    set_homepage('https://github.com/ConcertoEngine/Concerto')
    set_description('Concerto engine')
    set_license('MIT')
    set_kind('library')
    add_urls('https://github.com/ConcertoEngine/Concerto.git')
    add_versions('2023.11.17', 'ec459056d0f8ba9bfa8979a3114d44db77d2bc25')
    add_deps('ConcertoCore')
    add_deps("nazaraengine", {debug=is_mode('debug'), configs={ utility = true,
                                                                audio = false,
                                                                renderer = true,
                                                                joltphysics3d = false,
                                                                bulletphysics3d = false,
                                                                graphics = true,
                                                                plugin_assimp = false,
                                                                platform = true,
                                                                chipmunkphysics2d = false,
                                                                widgets = false,
                                                                network = false}})

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)
