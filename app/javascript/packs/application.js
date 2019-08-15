import "bootstrap";

console.log("Hello World")

document.querySelectorAll('.menu-svg').forEach((el) => {

    const imgID = el.getAttribute('id');
    const imgClass = el.getAttribute('class');
    const imgURL = el.getAttribute('src');

    request({url: imgURL}).then((data) => {

      const parser = new DOMParser();
      const xmlDoc = parser.parseFromString(data, 'text/html');
      let svg = xmlDoc.querySelector('svg');

      if (typeof imgID !== 'undefined') {
        svg.setAttribute('id', imgID);
      }

      if(typeof imgClass !== 'undefined') {
        svg.setAttribute('class', imgClass + ' replaced-svg');
      }

      svg.removeAttribute('xmlns:a');
      el.parentNode.replaceChild(svg, el);
    })
  });
