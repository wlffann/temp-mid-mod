$(document).ready(() => {
  let $textFilter = $('input[name=text_filter]')
  $textFilter.on('keyup', () => {
    filterByText($textFilter.val())
  })
})

const filterByText = (text) => {
  $('.link').hide()
  $('.link').filter(() => {
    return $(`.link:contains(${text})`).show() 
  }) 
} 
