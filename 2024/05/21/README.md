# Today I Learned 20240521

Today, at work, we had some unexpected behavior.
Changing a single test source file caused a bunch of seemingly unrelated compilation.
This leads directly to today's learnings.

## `ninja -d explain`

You can ask [`ninja`][ninja-build] why it needs to (re)build a target!
```sh
ninja -d explain
```

It's great!
So this told us pretty quickly that we needed to rebuild a bunch of stuff because a [`configure_file`][configure_file] version header (actually multiple) was dirty.
Someone made the version header have a build timestamp in it!
Rip that out.
Don't put timestamps in your build.

Notionally, this fixes our excessive recompilation and I check out.

## CMake reconfiguration triggers

Later, a colleague noticed that the project reconfigured any time he modified a template TOML file.
This led to us realizing that CMake will reconfigure any time you modify the input file to [`configure_file`][configure_file].
This seems maybe a little heavy-handed, but it's understandable.
I now have a stupid idea to create a lazy-evaluation version of [`configure_file`][configure_file] that happens at build-time rather than configure-time and only as necessary.

Bringing it full circle, someone read the docs on [`gtest_add_tests`][gtest_add_tests].
Yup, it turns out that CMake has to reconfigure everyy time you modify a source file passed to [`gtest_add_tests`][gtest_add_tests]

[configure_file]: https://cmake.org/cmake/help/latest/command/configure_file.html "configure_file CMake command documentation"
[gtest_add_tests]: https://cmake.org/cmake/help/latest/module/GoogleTest.html#command:gtest_add_tests "GoogleTest CMake module documentation"
[ninja-build]: https://ninja-build.org/ "Ninja, a small build system with a focus on speed"
