TMPDIR="$BATS_TMPDIR/bats.$$.tmp"

MAKEFILE="$TMPDIR/Makefile"
MK="$BATS_TEST_DIRNAME/../zip.mk"

@test "make zip" {
	cat > "$MAKEFILE" <<EOF
include $MK
test.zip: a b
EOF

	touch "$TMPDIR/a"
	mkdir "$TMPDIR/b"
	touch "$TMPDIR/b/c"
	echo "$TMPDIR" > /dev/stderr

	make -C "$TMPDIR" "test.zip"
	[ -e "$TMPDIR/test.zip" ]
	expected="a
b/
b/c"
	[ "$(unzip -Z -1 "$TMPDIR/test.zip" | sort)" = "$expected" ]
}

setup() {
	mkdir "$TMPDIR"
}

teardown() {
	rm -rf "$TMPDIR"
}
