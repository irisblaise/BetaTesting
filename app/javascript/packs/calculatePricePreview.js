const calculatePricePreview = () => {
  const testersQuantity = document.querySelector('#version_quantity');

  if (testersQuantity) {
    testersQuantity.addEventListener('keyup', (e) => {
      const result = testersQuantity.value * 20;
      document.querySelector('#values').innerHTML = `Your total price: € ${result}`;
    })
  }
}

export { calculatePricePreview }
