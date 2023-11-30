package('ConcertoEngine')
    set_homepage('https://github.com/ConcertoEngine/Concerto')
    set_description('Concerto engine')
    set_license('MIT')
    set_kind('library')
    add_urls('https://github.com/ConcertoEngine/Concerto.git')
    add_versions('2023.11.30+1', 'adacf9bb0a372d0865215a54a08c2f78f62f0032')
    add_deps('ConcertoCore')

    on_load(function (package)
        if package:config("graphics") then
            package:add('deps', 'nazaraengine', {configs={ debug = package:is_debug(),
                                                        utility = true,
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
        end
    end)

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)
