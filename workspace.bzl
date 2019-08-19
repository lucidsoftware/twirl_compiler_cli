"""
Load 3rd party maven dependencies
"""

load("@rules_jvm_external//:defs.bzl", "maven_install")

def twirl_compiler_cli_repositories():
    maven_install(
        name = "twirl_compiler_cli_maven",
        artifacts = [
            "com.github.scopt:scopt_2.12:3.7.0",
            "com.typesafe.play:twirl-compiler_2.12:1.4.2",
            "org.scala-sbt:zinc_2.12:1.2.1",
            "org.scala-sbt:compiler-interface:1.2.1",
            "org.scala-sbt:util-interface:1.2.0",
            "org.scala-lang:scala-compiler:2.12.8",
            "org.scala-lang:scala-library:2.12.8",
            "org.scala-lang:scala-reflect:2.12.8",
        ],
        repositories = [
            "http://central.maven.org/maven2",
        ],
        fetch_sources = True,
        maven_install_json = "//:twirl_compiler_cli_maven_install.json",
    )
