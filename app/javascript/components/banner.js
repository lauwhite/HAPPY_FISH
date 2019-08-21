const bannerLogic = () => {

  const bannerSignIn = document.getElementById('banner-sign-in')
  const bannerSignUp = document.getElementById('banner-sign-up')
  const bannerTabs = document.querySelectorAll('#banner-tab .nav-link');

  bannerTabs.forEach((tab) => {
    tab.addEventListener('click', (e) => {
      if (e.currentTarget.id === 'home-tab') {
        bannerSignIn.classList.remove('d-none');
        bannerSignUp.classList.add('d-none');
      } else {
        bannerSignUp.classList.remove('d-none');
        bannerSignIn.classList.add('d-none');
      }
    });
  });
}
// if (homeTab.classList.contains('active')) {
//   bannerSignUp.classList.add('d-none')
//   bannerSignIn.classList.remove('d-none')
// }

export { bannerLogic }
