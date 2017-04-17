$(document).ready(() => {
  $('#only_read').on('click', (event) => {
    event.preventDefault()
    $('.link.read-false').hide()
  })
})
