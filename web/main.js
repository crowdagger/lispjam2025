window.addEventListener("load", function() {
  Scheme.load_main("main.wasm", {
    user_imports: {
      document: {
        body() { return document.body; },
        createTextNode: Document.prototype.createTextNode.bind(document)
      },
      element: {
          appendChild(parent, child) { return parent.appendChild(child); },
          setHtml(elem, html) { elem.innerHTML = html; }
      }
    }
  });
});
