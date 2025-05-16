GUILE=guile -L .

run:
	$(GUILE) main.scm

test:
	$(GUILE) tests/tests.scm

clean:
	rm *.wasm
