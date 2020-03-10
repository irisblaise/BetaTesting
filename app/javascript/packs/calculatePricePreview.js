const calculatePricePreview = () => {
  const testersQuantity = document.querySelector('#version_quantity');

  testersQuantity.addEventListener('keyup', (e) => {
    const result = testersQuantity.value * 20;
    document.querySelector('#values').innerHTML = `The estimate price would be: ${result}`;
  })
}

export { calculatePricePreview }
