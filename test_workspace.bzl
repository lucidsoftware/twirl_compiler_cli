"""
Load test 3rd party maven dependencies
"""

load("@rules_jvm_external//:defs.bzl", "maven_install")
load(":workspace.bzl", "scala3_version", "twirl_version")

specs2_version = "5.5.1"

def twirl_compiler_cli_test_repositories():
    maven_install(
        name = "twirl_compiler_cli_test_maven",
        artifacts = [
            "org.playframework.twirl:twirl-api_3:{}".format(twirl_version),
            "org.specs2:specs2-common_3:{}".format(specs2_version),
            "org.specs2:specs2-core_3:{}".format(specs2_version),
            "org.specs2:specs2-matcher_3:{}".format(specs2_version),
            "org.scala-lang:scala3-library_3:{}".format(scala3_version),
        ],
        repositories = [
            "https://repo.maven.apache.org/maven2",
        ],
        fetch_sources = True,
        fail_if_repin_required = True,
        maven_install_json = "//:twirl_compiler_cli_test_maven_install.json",
    )
