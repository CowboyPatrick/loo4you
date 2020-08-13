const initSubmitIcon = () => {
  const searchIcon = document.querySelector(".search-form-control i")
  if (searchIcon) {
    searchIcon.addEventListener("click", (event) => {
      document.querySelector(".search-form-control form").submit()
    })
  }
}

export { initSubmitIcon };
