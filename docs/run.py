from livereload import Server, shell

if __name__ == "__main__":
    server = Server()
    server.watch("../*.rst", shell("make html"), delay=1)
    server.watch("../*.md", shell("make html"), delay=1)
    server.watch("../hello_world/**/*.py", shell("make html"), delay=1)
    server.watch("docs/source/*.rst", shell("make html"), delay=1)
    server.watch("docs/source/**/*.rst", shell("make html"), delay=1)
    server.watch("docs/source/*.md", shell("make html"), delay=1)
    server.watch("docs/source/**/*.md", shell("make html"), delay=1)
    server.watch("docs/source/*.py", shell("make html"), delay=1)
    server.watch("docs/source/**/*.py", shell("make html"), delay=1)
    server.watch("docs/source/_static/*", shell("make html"), delay=1)
    server.watch("docs/source/_templates/*", shell("make html"), delay=1)
    server.serve(root="docs/build/html")
