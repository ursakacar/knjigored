var searchFunction = function () {
  const searchInput = document.getElementById('books-search-input').value
  const destination = `/knjige?query=${searchInput}`
  window.location.href = destination
}

window.addEventListener('load',function () {
  document.getElementById('books-search-button').addEventListener('click', searchFunction)
  document.getElementById('books-search-input').addEventListener('keyup', function (event) {
    if (event.keyCode === 13) {
      searchFunction()
    }
  })
})

