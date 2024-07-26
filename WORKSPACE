workspace(name = "twirl_compiler_cli")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# rules_java
http_archive(
    name = "rules_java",
    sha256 = "647bb31c0d51882549def6f67ee9078df697043406ed4a5144bbdf3b17f91e33",
    urls = [
        "https://github.com/bazelbuild/rules_java/releases/download/7.8.0/rules_java-7.8.0.tar.gz",
    ],
)

load("@rules_java//java:repositories.bzl", "rules_java_dependencies")

rules_java_dependencies()

register_toolchains("//:repository_default_toolchain_21_definition")

# rules_jvm_external
rules_jvm_external_version = "6.0"

http_archive(
    name = "rules_jvm_external",
    sha256 = "c44568854d8bb92fe0f7dd6b1e8957ae65e45e32a058727fcf62aaafbd36f17b",
    strip_prefix = "rules_jvm_external-{}".format(rules_jvm_external_version),
    type = "zip",
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/{}.zip".format(rules_jvm_external_version),
)

load("@rules_jvm_external//:repositories.bzl", "rules_jvm_external_deps")

rules_jvm_external_deps()

load("@rules_jvm_external//:setup.bzl", "rules_jvm_external_setup")

rules_jvm_external_setup()

load("//:workspace.bzl", "twirl_compiler_cli_repositories")

twirl_compiler_cli_repositories()

load(
    "@twirl_compiler_cli_maven//:defs.bzl",
    twirl_compiler_cli_pinned_maven_install = "pinned_maven_install",
)

twirl_compiler_cli_pinned_maven_install()

load("//:test_workspace.bzl", "twirl_compiler_cli_test_repositories")

twirl_compiler_cli_test_repositories()

load(
    "@twirl_compiler_cli_test_maven//:defs.bzl",
    twirl_compiler_cli_test_pinned_maven_install = "pinned_maven_install",
)

twirl_compiler_cli_test_pinned_maven_install()

# higherkindness/rules_scala
rules_scala_annex_version = "c8c4345e3f354753ed4ae7830618467ab59262c6"

http_archive(
    name = "rules_scala_annex",
    integrity = "sha256-pmES8mOOeirB5woNYT2w97+5+C0Bt8ghrj9lHBKkMy8=",
    strip_prefix = "rules_scala-{}".format(rules_scala_annex_version),
    type = "zip",
    url = "https://github.com/lucidsoftware/rules_scala/archive/{}.zip".format(rules_scala_annex_version),
)

bind(
    name = "default_scala",
    actual = "//scala:default_scala",
)

load(
    "@rules_scala_annex//rules/scala:workspace.bzl",
    "scala_register_toolchains",
    "scala_repositories",
)

scala_repositories()

load("@annex//:defs.bzl", annex_pinned_maven_install = "pinned_maven_install")

annex_pinned_maven_install()

scala_register_toolchains()

# Skylib
skylib_version = "1.5.0"  # update this as needed

http_archive(
    name = "bazel_skylib",
    sha256 = "19a99bc16079c8853f96d50e627afa158aa00bf52460f45f923466105ff8fe13",
    strip_prefix = "bazel-skylib-{}".format(skylib_version),
    type = "zip",
    url = "https://github.com/bazelbuild/bazel-skylib/archive/{}.zip".format(skylib_version),
)

graknlabs_bazel_distribution_version = "ebb4660cff37574876d37bf7c498bd735155554f"

http_archive(
    name = "graknlabs_bazel_distribution",
    sha256 = "c3181786d2544a7df54bcf326d5e40e6ec0b86dbc6c42e58d40f8c2c2225859f",
    strip_prefix = "bazel-distribution-{}".format(graknlabs_bazel_distribution_version),
    type = "zip",
    url = "https://github.com/graknlabs/bazel-distribution/archive/{}.zip".format(graknlabs_bazel_distribution_version),
)

# For buildifier (for linting)
http_archive(
    name = "io_bazel_rules_go",
    sha256 = "2c6388e97cb4fb30546d65e983c45bb422bfe32c6e946af329cd1c52f1eaf836",
    strip_prefix = "rules_go-0.39.1",
    urls = [
        "https://github.com/bazelbuild/rules_go/archive/v0.39.1.zip",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.20.3")

http_archive(
    name = "bazel_gazelle",
    sha256 = "dfd6ee9d6b7aacf042c8d385177ebf459148cffb9d0b5b855aedd03234faafd7",
    strip_prefix = "bazel-gazelle-0.30.0",
    urls = [
        "https://github.com/bazelbuild/bazel-gazelle/archive/v0.30.0.zip",
    ],
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

http_archive(
    name = "com_google_protobuf",
    sha256 = "25680843adf0c3302648d35f744e38cc3b6b05a6c77a927de5aea3e1c2e36106",
    strip_prefix = "protobuf-3.19.4",
    urls = [
        "https://github.com/protocolbuffers/protobuf/archive/v3.19.4.zip",
    ],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

buildtools_version = "4.2.2"

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "c0b20a3e5fe03d28a31c0ba9d41e3d7c285b150089ff868c8aab91cfa5df4552",
    strip_prefix = "buildtools-{}".format(buildtools_version),
    urls = [
        "https://github.com/bazelbuild/buildtools/archive/{}.zip".format(buildtools_version),
    ],
)

load("@com_github_bazelbuild_buildtools//buildifier:deps.bzl", "buildifier_dependencies")

buildifier_dependencies()

# bazel-common
bazelcommon_version = "3d605944eb8d238ad8eeecb8cb2021900bfb12ae"

http_archive(
    name = "bazel-common",
    sha256 = "340197de85263270dd45ab4f9925aa9e3b367abae941208e7bf9a653b31b5b76",
    strip_prefix = "bazel-common-{}".format(bazelcommon_version),
    type = "zip",
    url = "https://github.com/google/bazel-common/archive/{}.zip".format(bazelcommon_version),
)

load("@bazel-common//:workspace_defs.bzl", "google_common_workspace_rules")

google_common_workspace_rules()

# Make COMPILER_CLI_ARTIFACT_ID available in BUILD files
env_vars_to_bzl_vars_version = "d67a600bb0917cd0e1c7a17ee78a3e2110fdbde2"

http_archive(
    name = "env_vars_to_bzl_vars",
    sha256 = "f0f7077a83590ff566c8ef17b74ca02728592f6f400eecb6d3ccef8997a9f41d",
    strip_prefix = "env_vars_to_bzl_vars-{}".format(env_vars_to_bzl_vars_version),
    type = "zip",
    url = "https://github.com/SrodriguezO/env_vars_to_bzl_vars/archive/{}.zip".format(env_vars_to_bzl_vars_version),
)

load("@env_vars_to_bzl_vars//:env_vars_loader.bzl", "load_env_vars")

load_env_vars(
    name = "env_vars",
    env_vars = ["COMPILER_CLI_ARTIFACT_ID"],
)

# rules_twirl (for tests)
rules_twirl_version = "299de4ffed6950dac2696098e364e94f67ca0eb5"

http_archive(
    name = "io_bazel_rules_twirl",
    sha256 = "84020420828292888d815c887572e76a62b3f82cd2d16ab3f748642b08251002",
    strip_prefix = "rules_twirl-{}".format(rules_twirl_version),
    type = "zip",
    url = "https://github.com/lucidsoftware/rules_twirl/archive/{}.zip".format(rules_twirl_version),
)

load("@io_bazel_rules_twirl//:workspace.bzl", "twirl_repositories")

twirl_repositories()

load("@twirl//:defs.bzl", twirl_pinned_maven_install = "pinned_maven_install")

twirl_pinned_maven_install()
