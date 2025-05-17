GUILE=guile -L .

main.wasm: main-web.scm
	guild compile-wasm -L . -o main.wasm main-web.scm

run:
	$(GUILE) main.scm

test:
	$(GUILE) tests/tests.scm

serve: main.wasm
	$(GUILE) -c '((@ (hoot web-server) serve))'


clean:
	rm *.wasm
