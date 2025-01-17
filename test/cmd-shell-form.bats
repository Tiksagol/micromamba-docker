setup_file() {
    load 'test_helper/common-setup'
    _common_setup
    docker build --quiet \
                 --tag=micromamba:test-cmd-shell-form \
		 --file=${PROJECT_ROOT}/test/cmd-shell-form.Dockerfile \
		 "${PROJECT_ROOT}/test" > /dev/null
}

setup() {
    load 'test_helper/common-setup'
    _common_setup
}

@test "CMD python -c \"print('hello')\"" {
    run docker run --rm micromamba:test-cmd-shell-form
    assert_output 'hello'
}

@test "CMD python -c \"print('hello')\" with --user" {
    run docker run --rm --user=1001:1001 micromamba:test-cmd-shell-form
    assert_output 'hello'
}
