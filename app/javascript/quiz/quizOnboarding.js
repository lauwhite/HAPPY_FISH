// 1 . storer les questions et réponses dans une constante (array d'objets)

const questionAndAnswer = [
  {
    question: "How would you describe your diet ?",
    answers: {
      one: 'Omnivore',
      two: 'Pesco-Vegetarian',
      three: 'Vegetarian',
      four: 'Vegan'
    }
  },
  {
    question: 'What kind of food do you eat?',
    answers: {
      one: 'I love processed food',
      two: 'I eat a lot of frozen food',
      three: 'I try to eat organic food',
      four: 'I eat healthy local and seasonal food'
    }
  },
  {
    question: 'What kind of coffee do you drink?',
    answers: {
      one: 'Nespresso',
      two: 'Organic reusable cup',
      three: 'Instant',
      four: 'I do not drink coffee'
    }
  }
];

let i = 0;

const whichAnswer = (e) => {
  if (e.firstElementChild.value === '0') {
    score.innerText = parseInt(score.innerText, 10) + 0;
  } else if (e.firstElementChild.value === '5') {
    score.innerText = parseInt(score.innerText, 10) + 5;
  } else if (e.firstElementChild.value === '10') {
    score.innerText = parseInt(score.innerText, 10) + 10;
  } else if (e.firstElementChild.value === '15') {
    score.innerText = parseInt(score.innerText, 10) + 15;
  }
  // changeAnswer(i);
  // i += 1;
};

// I want a function that will change the content of the question and answerst
const changeAnswer = (i) => {
  const questionLabel = document.querySelector('.question_label');
  const qOne = document.querySelectorAll('.form-check.answer');
  nextQuestionButtonLifestyle.addEventListener('click', (e) => {
    e.preventDefault();
    questionLabel.innerText = questionAndAnswer[i].question;
    answerOne.innerText = questionAndAnswer[i].answers.one;
    answerTwo.innerText = questionAndAnswer[i].answers.two;
    answerThree.innerText = questionAndAnswer[i].answers.three;
    answerFour.innerText = questionAndAnswer[i].answers.four;
    resetAll(qOne);
  });
};

// const lastSet = () => {
//   const questionLabel = document.querySelector('.question_label');
//   if (questionLabel.innerText === "What kind of coffee do you drink?") {
//     nextButton.classList.remove('d-none');
//   }
// };

export {changeAnswer, whichAnswer }

const qOne = document.querySelectorAll('.form-check.answer');
let i = 0;

qOne.forEach((question) => {
  question.addEventListener('click', (e) => {
    qOne.forEach(a => a.classList.remove('right-answer'));
    e.currentTarget.classList.toggle('right-answer');
    changeAnswer(i);
    i += 1;
  });
});
