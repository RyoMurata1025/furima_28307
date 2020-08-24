window.addEventListener('click', function(){

let inputBox = document.getElementById("item-price");
inputBox.oninput = (e) => {
    // if (!isNaN(e.target.value)) {
        document.getElementById("item-price").innerHTML = "";
        let num = Number(e.target.value);
        let tax = Number(num) * 0.1; // 販売手数料
        document.getElementById("add-tax-price").innerHTML = Math.floor(tax);
        document.getElementById("profit").innerHTML = num - Math.floor(tax);
        }

})







