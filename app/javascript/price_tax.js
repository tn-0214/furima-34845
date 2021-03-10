window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
      const TaxAmount = inputValue * 0.1
    addTaxDom.innerHTML = TaxAmount ;

    const profitAmount = document.getElementById("profit");
    profitAmount.innerHTML = Math.floor(inputValue - TaxAmount); 

    
})
});
