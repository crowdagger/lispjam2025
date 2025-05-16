GUILE=guile -L .

main.wasm: main-web.scm
	guild compile-wasm -o main.wasm main-web.scm

run:
	$(GUILE) main.scm

test:
	$(GUILE) tests/tests.scm

serve: main.wasm
	guile -c '((@ (hoot web-server) serve))'


clean:
	rm *.wasm
