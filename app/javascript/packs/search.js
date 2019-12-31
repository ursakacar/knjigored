var searchFunction = function () {
  const searchInput = document.getElementById('books-search-input').value
  const destination = `/knjige?query=${searchInput}`
  window.location.href = destination
}

window.addEventListener('turbolinks:load',function () {
  var searchButton = document.getElementById('books-search-button')
  var searchInput = document.getElementById('books-search-input')

  if (searchButton) {
    searchButton.addEventListener('click', searchFunction)
  }

  if (searchInput) {
    searchInput.addEventListener('keyup', function (event) {
      if (event.keyCode === 13) {
        searchFunction()
      }
    })
  }
})

