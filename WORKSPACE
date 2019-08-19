workspace(name = "twirl_compiler_cli")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# rules_jvm_external
rules_jvm_external_version = "2.5"
http_archive(
    name = "rules_jvm_external",
    sha256 = "249e8129914be6d987ca57754516be35a14ea866c616041ff0cd32ea94d2f3a1",
    strip_prefix = "rules_jvm_external-{}".format(rules_jvm_external_version),
    type = "zip",
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/{}.zip".format(rules_jvm_external_version),
)

load(":workspace.bzl", "twirl_compiler_cli_repositories")
twirl_compiler_cli_repositories()
load("@twirl_compiler_cli_maven//:defs.bzl", twirl_compiler_cli_pinned_maven_install = "pinned_maven_install")
twirl_compiler_cli_pinned_maven_install()

load("//:test_workspace.bzl", "twirl_compiler_cli_test_repositories")
twirl_compiler_cli_test_repositories()
load("@twirl_compiler_cli_test_maven//:defs.bzl", twirl_compiler_cli_test_pinned_maven_install = "pinned_maven_install")
twirl_compiler_cli_test_pinned_maven_install()

# higherkindness/rules_scala
rules_scala_annex_version = "ac2101359ec810f9e129d47aa0306608035dacf2" # update this as needed
http_archive(
    name = "rules_scala_annex",
    sha256 = "5803bbc490570a188ba0183ce2a3ca2b5d1e1078466945ec0d75427b29f74aac",
    strip_prefix = "rules_scala-{}".format(rules_scala_annex_version),
    type = "zip",
    url = "https://github.com/higherkindness/rules_scala/archive/{}.zip".format(rules_scala_annex_version),
)

bind(
    name = "default_scala",
    actual = "//scala:default_scala",
)

load("@rules_scala_annex//rules/scala:workspace.bzl", "scala_register_toolchains", "scala_repositories")
scala_repositories()
scala_register_toolchains()

# Java 8 is needed for Scala 2.11; this is needed to enable that
jdk_build_file_content = """
filegroup(
    name = "jdk",
    srcs = glob(["**/*"]),
    visibility = ["//visibility:public"],
)
filegroup(
    name = "java",
    srcs = ["bin/java"],
    visibility = ["//visibility:public"],
)
"""

http_archive(
    name = "jdk8-linux",
    build_file_content = jdk_build_file_content,
    sha256 = "dd28d6d2cde2b931caf94ac2422a2ad082ea62f0beee3bf7057317c53093de93",
    strip_prefix = "jdk8u212-b03",
    url = "https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u212-b03/OpenJDK8U-jdk_x64_linux_hotspot_8u212b03.tar.gz",
)

http_archive(
    name = "jdk8-osx",
    build_file_content = jdk_build_file_content,
    sha256 = "3d80857e1bb44bf4abe6d70ba3bb2aae412794d335abe46b26eb904ab6226fe0",
    strip_prefix = "jdk8u212-b03/Contents/Home",
    url = "https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u212-b03/OpenJDK8U-jdk_x64_mac_hotspot_8u212b03.tar.gz",
)

# Protobuf
protobuf_version = "3.9.0"
http_archive(
    name = "com_google_protobuf",
    sha256 = "8eb5ca331ab8ca0da2baea7fc0607d86c46c80845deca57109a5d637ccb93bb4",
    strip_prefix = "protobuf-{}".format(protobuf_version),
    type = "zip",
    url = "https://github.com/protocolbuffers/protobuf/archive/v{}.zip".format(protobuf_version),
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")
protobuf_deps()

# bazel-common
bazelcommon_version = "0d4a76d35fe28caf5c887ff39bfd7374b993094b"
http_archive(
  name = "bazel-common",
  sha256 = "00f68b50b535e56daf563899cf6b924737d29127b8f2cb1fbcc473dbe4efad4a",
  type = "zip",
  strip_prefix = "bazel-common-{}".format(bazelcommon_version),
  url = "https://github.com/google/bazel-common/archive/{}.zip".format(bazelcommon_version)
)

load("@bazel-common//:workspace_defs.bzl", "google_common_workspace_rules")
google_common_workspace_rules()

# Make the TRAVIS_TAG available in BUILD files
env_vars_to_bzl_vars_version = "d67a600bb0917cd0e1c7a17ee78a3e2110fdbde2"
http_archive(
  name = "env_vars_to_bzl_vars",
  sha256 = "f0f7077a83590ff566c8ef17b74ca02728592f6f400eecb6d3ccef8997a9f41d",
  type = "zip",
  strip_prefix ="env_vars_to_bzl_vars-{}".format(env_vars_to_bzl_vars_version),
  url = "https://github.com/SrodriguezO/env_vars_to_bzl_vars/archive/{}.zip".format(env_vars_to_bzl_vars_version)
)

load("@env_vars_to_bzl_vars//:env_vars_loader.bzl", "load_env_vars")
load_env_vars(
  name = "env_vars",
  env_vars = ["COMPILER_CLI_ARTIFACT_ID", "COMPILER_CLI_VERSION"]
)

# rules_twirl (for tests)
rules_twirl_version = "d2b33b3d4afa25c139912eff5b5f3e27cdc60e0c"
http_archive(
  name = "io_bazel_rules_twirl",
  sha256 = "135a929891c253a8a3df6ea72cbf3ba0d951dd0586670aaab3c8a56b693984d6",
  strip_prefix = "rules_twirl-{}".format(rules_twirl_version),
  type = "zip",
  url = "https://github.com/lucidsoftware/rules_twirl/archive/{}.zip".format(rules_twirl_version),
)

load("@io_bazel_rules_twirl//:workspace.bzl", "twirl_repositories")
twirl_repositories()
load("@twirl//:defs.bzl", twirl_pinned_maven_install = "pinned_maven_install")
twirl_pinned_maven_install()
