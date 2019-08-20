const onboardingScoreCalc = () => {
  console.log("helloooo")
  const nextQuestionButton = document.querySelector(".next-q-btn");
  const answers = document.querySelectorAll(".form-check");
  const messageInput = document.querySelector(".motivation_message")

  if (nextQuestionButton) {
    answers.forEach((answer) => {
      answer.addEventListener("click", (e) => {
        nextQuestionButton.style.display = "block";
        e.currentTarget.classList.remove("answer");
        e.currentTarget.classList.add("right-answer");
        console.log(e)
      });
    });
  }
}

export { onboardingScoreCalc }
