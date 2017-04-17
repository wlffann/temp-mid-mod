$(document).ready(() => {
  $('#submit-link').on('click', createLink)
})

const createLink = (event) => {
  event.preventDefault()
  let link = formatLink()
  sendLink(link)
  .done((linkMarkdown) => {
    addLink(linkMarkdown)
    clearErrors()
  })
  .fail((response) => {
    clearErrors()
    addErrors(response)
  })
} 

const clearErrors = () => {
 $('#errors').empty() 
}

const addErrors = (response) => {
  let error = JSON.parse(response.responseText).errors[0]
  $('body').prepend(`<p id='errors'>${error}</p>`)
}

const formatLink = () => {
  return {
          link: {
            user_id: $('input[name=user_id]').val(),
            title: $('input[name=link_title]').val(),
            url: $('input[name=link_url]').val()
            }
          }
}

const addLink = (linkMarkdown) => {
  $('.links').append(linkMarkdown)
  $('input[name=link_title]').val("")
  $('input[name=link_url]').val("")
}

const sendLink = (link) => {
  return $.ajax({
    url: '/api/v1/links',
    method: 'POST',
    data: link
  })
}
