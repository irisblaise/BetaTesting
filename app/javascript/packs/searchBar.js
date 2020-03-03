
const activateSearchBar = () => {
  const searchBox = document.querySelectorAll('.search-box input[type="text"] + span');

  if (searchBox) {
    searchBox.forEach((elm) => {
      elm.addEventListener('click', () => {
        elm.previousElementSibling.value = '';
      });
    })
  }
}

export { activateSearchBar }
