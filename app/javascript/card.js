const pay = () => {
  Payjp.setPublicKey("pk_test_78c149fd2ab8ffbc8aca9e67");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_address[number]"),
      cvc: formData.get("order_address[cvc]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("order_address_number").removeAttribute("name");
      document.getElementById("order_address__cvc").removeAttribute("name");
      document.getElementById("order_address_exp_month").removeAttribute("name");
      document.getElementById("order_address_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);