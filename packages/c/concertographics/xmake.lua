package('ConcertoGraphics')
    set_homepage('https://github.com/ConcertoEngine/ConcertoGraphics')
    set_description('Concerto engine graphics library')
    set_license('MIT')
    set_kind('library')
    add_urls('https://github.com/ConcertoEngine/ConcertoGraphics.git')
    add_versions('2023.03.13+2', 'ab589b2644d6db87e81abd804f10193b5ad64e29')
    add_deps('ConcertoCore', 'vulkan-loader', 'vulkan-memory-allocator', 'vk-bootstrap', 'glm', 'stb', 'glfw', 'vulkan-validationlayers', 'imgui')

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)
