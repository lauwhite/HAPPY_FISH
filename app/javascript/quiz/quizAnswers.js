const resetAll = (answers) => {
  answers.forEach((answer) => {
    answer.classList.remove("wrong-answer");
    answer.classList.remove("right-answer");
    answer.classList.add("answer");
  })
}

const correctAnswerSearch = () => {
  const nextQuestionButton = document.querySelector(".next-q-btn");
  const answers = document.querySelectorAll(".form-check");
  const messageInput = document.querySelector(".motivation_message")

  if (nextQuestionButton) {
    answers.forEach((answer) => {
      answer.addEventListener("click", (e) => {
        resetAll(answers);
        const correctAnswer = e.currentTarget.firstElementChild.value;
        if (correctAnswer == "true") {
          e.currentTarget.classList.remove("answer");
          e.currentTarget.classList.add("right-answer");
          messageInput.innerText = "You got it right !"
          nextQuestionButton.style.display = "block";
        } else {
          e.currentTarget.classList.remove("answer");
          e.currentTarget.classList.add("wrong-answer");
          messageInput.innerText = "Nope, try again ! "
        }
      });
    });
  }
}

export { correctAnswerSearch }
