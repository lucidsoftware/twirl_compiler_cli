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

# Skylib
skylib_version = "0.9.0"  # update this as needed
http_archive(
    name = "bazel_skylib",
    sha256 = "a8677c64e2a58eb113f305784e6af9759cfa3f9a6eacb4d40531fe1bd6356aca",
    strip_prefix = "bazel-skylib-{}".format(skylib_version),
    type = "zip",
    url = "https://github.com/bazelbuild/bazel-skylib/archive/{}.zip".format(skylib_version),
)

# To use the JavaScript version of Sass, we need to first install nodejs
rules_nodejs_version = "84882ba224f51f85d589e9cd45b30758cfdbf006"
http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "8662ffdaedbee7b85d4aadbbe8005a65cceea128bb0d07aa892998e3683caea2",
    strip_prefix = "rules_nodejs-{}".format(rules_nodejs_version),
    type = "zip",
    url = "https://github.com/bazelbuild/rules_nodejs/archive/{}.zip".format(rules_nodejs_version),
)
load("@build_bazel_rules_nodejs//:package.bzl", "rules_nodejs_dependencies")
rules_nodejs_dependencies()

load("@build_bazel_rules_nodejs//:defs.bzl", "node_repositories")
node_repositories(package_json = [])

# rules_sass
rules_sass_version = "8b61ad6953fde55031658e1731c335220f881369" # update this as needed
http_archive(
    name = "io_bazel_rules_sass",
    sha256 = "afb08f0ae0060c1dbdd11d22578972d087e5463e647ce35dfc2b6c2a41682da8",
    strip_prefix = "rules_sass-{}".format(rules_sass_version),
    type = "zip",
    url = "https://github.com/bazelbuild/rules_sass/archive/{}.zip".format(rules_sass_version),
)
load("@io_bazel_rules_sass//:package.bzl", "rules_sass_dependencies")
rules_sass_dependencies()

load("@io_bazel_rules_sass//sass:sass_repositories.bzl", "sass_repositories")
sass_repositories()

# Skydoc
skydoc_version = "b8a32e07ee8297c89ca8020af4fa2163a766706f" # update this as needed
http_archive(
    name = "io_bazel_skydoc",
    sha256 = "694602137e5d56cfd35622cf58c047549324a0db1522ee944ad86e74420be9db",
    strip_prefix = "skydoc-{}".format(skydoc_version),
    type = "zip",
    url = "https://github.com/bazelbuild/skydoc/archive/{}.zip".format(skydoc_version),
)
load("@io_bazel_skydoc//skylark:skylark.bzl", "skydoc_repositories")
skydoc_repositories()

# For Skylint
# Once https://github.com/bazelbuild/bazel/issues/4086 is done, this should be
# much simpler
http_archive(
    name = "io_bazel",
    sha256 = "2d86797a5b96163b7f5e9cbb8f09cc919066e7ee0fe1a614b79680ae36a14ef3",
    strip_prefix = "bazel-0.27.0",
    urls = ["https://github.com/bazelbuild/bazel/archive/0.27.0.zip"],
)

# Also for Skylint. Comes from
# https://github.com/cgrushko/proto_library/blob/master/WORKSPACE
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

# Get the version to publish the compiler-cli with
load("//:version_from_env.bzl", "version_from_env")
version_from_env(
  name = "compiler-cli-version",
  env_var = "TRAVIS_TAG"
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

load("@io_bazel_rules_twirl//:test_workspace.bzl", "twirl_test_repositories")
twirl_test_repositories()
load("@twirl_test//:defs.bzl", twirl_test_pinned_maven_install = "pinned_maven_install")
twirl_test_pinned_maven_install()
