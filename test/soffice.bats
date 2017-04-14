TMPDIR="$BATS_TMPDIR/bats.$$.tmp"

MAKEFILE="$TMPDIR/Makefile"
MK="$BATS_TEST_DIRNAME/../soffice.mk"

@test "make simple soffice pdf" {
	cat > "$MAKEFILE" <<EOF
include $MK
EOF

	cat > "$TMPDIR/document.txt" <<EOF
test
EOF

	run make -C "$TMPDIR" "document.pdf"
	[ "$status" -eq 0 ]
	[ -e "$TMPDIR/document.pdf" ]
}

setup() {
	mkdir "$TMPDIR"
}

teardown() {
	rm -rf "$TMPDIR"
}
