import "bootstrap";
import { correctAnswerSearch } from "../quiz/quizAnswers";
correctAnswerSearch();
import { onboardingScoreCalc } from "../onboarding-quiz/onboardingQuiz";
onboardingScoreCalc();

const inputbtn = document.querySelectorAll('.answer-onboard')
const submitButtons = document.querySelectorAll('.centered.d-none');
inputbtn.forEach((input) => {
  input.addEventListener('click', (e) => {
    submitButtons.forEach((btn) => btn.classList.add('d-none'));
    e.currentTarget.nextElementSibling.classList.remove('d-none');
 })
})
