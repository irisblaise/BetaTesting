const newQuestion = () => {
  const button = document.querySelector(".add-question");
  if (button){
    button.addEventListener("click", (event) => {
      event.preventDefault()

      // 1. if the input is not empty, add question to question list
      const input = document.querySelector('.question-input')
      const list = document.querySelector('#question-list')
      const versionId = list.dataset.version

      if (input.value) {
        fetch('/api/v1/questions', {
          method: 'POST',
          headers: {
            'Content-type': 'application/json'
          },
          body: JSON.stringify({
            question: {
              question: input.value,
              version_id: versionId
            }
          })
        })
          .then(response => response.json())
          .then(data => {
            list.insertAdjacentHTML('beforeend', `<li> ${ data.question } <button class="btn btn-danger delete-button">Delete</button></li>`)
            input.value = ''
          })
      }
    })
  }
}

const deleteQuestion = () => {
  document.addEventListener('click',function(e){
    if(e.target && e.target.classList.contains('delete-button')){
      console.log('click')
      //delete request api
      //make end point for api
    }
  })
}

export { newQuestion, deleteQuestion };
