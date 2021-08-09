window.addEventListener('load', () => {
  // 金額を入力した数値をpriceInputという変数に格納する
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    console.log(inputValue);

    const profit = document.getElementById("profit")
    const result = inputValue * 0.1
    console.log(result)
    profit.innerHTML = (Math.floor(inputValue - result));
    console.log(profit);
  })
});