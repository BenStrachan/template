(function() {
  $(document).ready(function() {
    // Attach wysihtml5 editor
    $('.wysihtml5-editor').each(function(i, elem) {
      $(elem).wysihtml5({
        toolbar: { "fa": true }
      });
    });
  });
})();
