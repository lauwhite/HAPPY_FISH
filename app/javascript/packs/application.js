import "bootstrap";
import { correctAnswerSearch } from "../quiz/quizAnswers";
import { bannerLogic } from "../components/banner";
import { onboardingScoreCalc, onboarding } from "../onboarding-quiz/onboardingQuiz";

correctAnswerSearch();
onboardingScoreCalc();
onboarding();
bannerLogic();

