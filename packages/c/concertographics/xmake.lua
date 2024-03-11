package('ConcertoGraphics')
    set_homepage('https://github.com/ConcertoEngine/ConcertoGraphics')
    set_description('Concerto engine graphics library')
    set_license('MIT')
    set_kind('library')
    add_urls('https://github.com/ConcertoEngine/ConcertoGraphics.git')
    add_versions('2024.03.11', 'a2f1e162cacd058aee788a9b8bc59a7408ef9baf')
    add_deps('ConcertoCore', 'vulkan-loader', 'vulkan-memory-allocator', 'glm', 'stb', 'glfw', 'imgui')

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)
