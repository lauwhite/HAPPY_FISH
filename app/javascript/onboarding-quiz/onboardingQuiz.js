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

export const onboarding = () => {
  const inputbtn = document.querySelectorAll('.answer-onboard')
  const submitButtons = document.querySelectorAll('.centered.d-none');
  inputbtn.forEach((input) => {
    input.addEventListener('click', (e) => {
      submitButtons.forEach((btn) => btn.classList.add('d-none'));
      e.currentTarget.nextElementSibling.classList.remove('d-none');
   })
  });
}

export { onboardingScoreCalc }
