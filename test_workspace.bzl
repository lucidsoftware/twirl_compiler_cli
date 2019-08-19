"""
Load test 3rd party maven dependencies
"""

load("@rules_jvm_external//:defs.bzl", "maven_install")

def twirl_compiler_cli_test_repositories():
    maven_install(
        name = "twirl_compiler_cli_test_maven",
        artifacts = [
            "com.typesafe.play:twirl-api_2.11:1.1.1",
            "org.specs2:specs2-common_2.11:3.6.6",
            "org.specs2:specs2-core_2.11:3.6.6",
            "org.specs2:specs2-matcher_2.11:3.6.6",
            "org.scala-lang:scala-library:2.11.12",
            "org.scala-lang:scala-reflect:2.11.12",
        ],
        repositories = [
            "http://central.maven.org/maven2",
        ],
        fetch_sources = True,
        maven_install_json = "//:twirl_compiler_cli_test_maven_install.json",
    )
