TMPDIR="$BATS_TMPDIR/bats.$$.tmp"

MAKEFILE="$TMPDIR/Makefile"
MK="$BATS_TEST_DIRNAME/../pdflatex.mk"

@test "make simple pdflatex" {
	cat > "$MAKEFILE" <<EOF
include $MK
EOF

	cat > "$TMPDIR/document.tex" <<EOF
\documentclass{article}

\begin{document}
Simple test
\end{document}
EOF

	run make -C "$TMPDIR" "document.pdf"
	[ "$status" -eq 0 ]
	[ -e "$TMPDIR/document.pdf" ]
}

@test "make invalid pdflatex" {
	cat > "$MAKEFILE" <<EOF
include $MK
EOF

	cat > "$TMPDIR/document.tex" <<EOF
EOF

	run make -C "$TMPDIR" "document.pdf"
	[ "$status" -ne 0 ]
	[ ! -e "$TMPDIR/document.pdf" ]
}

setup() {
	mkdir "$TMPDIR"
}

teardown() {
	rm -rf "$TMPDIR"
}
