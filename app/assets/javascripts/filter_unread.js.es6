$(document).ready(() => {
  $('#only_unread').on('click', (event) => {
    event.preventDefault()
    $('.link.read-true').hide()
  })
})
