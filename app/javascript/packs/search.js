window.addEventListener('load',function () {
  document.getElementById('books-search-button').addEventListener('click', function () {
    const searchInput = document.getElementById('books-search-input').value
    const destination = `/knjige?query=${searchInput}`
    window.location.href = destination
  })
})
