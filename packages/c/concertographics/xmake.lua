package('ConcertoGraphics')
    set_homepage('https://github.com/ConcertoEngine/ConcertoGraphics')
    set_description('Concerto engine graphics library')
    set_license('MIT')
    set_kind('library')
    add_urls('https://github.com/ConcertoEngine/ConcertoGraphics.git')
    add_versions('2023.03.31', 'ee9ffac3bf92dcf22252f1a3fe63dcf7f390477e')
    add_deps('ConcertoCore', 'vulkan-loader', 'vulkan-memory-allocator', 'vk-bootstrap', 'glm', 'stb', 'glfw', 'imgui')

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)
