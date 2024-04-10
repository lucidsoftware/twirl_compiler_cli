"""
Load 3rd party maven dependencies
"""

load("@rules_jvm_external//:defs.bzl", "maven_install")
load("@rules_jvm_external//:specs.bzl", "maven")

scala3_version = "3.4.0"
twirl_version = "2.0.4"

def twirl_compiler_cli_repositories():
    maven_install(
        name = "twirl_compiler_cli_maven",
        artifacts = [
            "org.scala-lang:scala3-compiler_3:{}".format(scala3_version),
            "org.scala-lang:scala3-library_3:{}".format(scala3_version),
            "org.scala-sbt:compiler-interface:1.9.3",
            # Set neverlink = True to avoid Scala 2 library being pulled on to the compiler classpath
            maven.artifact("org.scala-lang", "scala3-sbt-bridge", scala3_version, neverlink = True),
            "com.github.scopt:scopt_3:4.1.0",
            "org.playframework.twirl:twirl-compiler_3:{}".format(twirl_version),
            "org.scala-lang.modules:scala-parser-combinators_3:2.3.0",
            "org.scala-sbt:zinc_2.13:1.9.3",
            "org.scala-sbt:util-interface:1.9.2",
        ],
        repositories = [
            "https://repo.maven.apache.org/maven2",
        ],
        fail_if_repin_required = True,
        fetch_sources = True,
        maven_install_json = "//:twirl_compiler_cli_maven_install.json",
    )
