function validateRecaptcha (id) {
    if (id != 0) {
      var button = document.querySelector(".next-submit");
      button.removeAttribute('disabled');
    }
  }