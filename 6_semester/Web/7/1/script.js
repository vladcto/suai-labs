$(window).on("load", function () {
  alert("I loaded!")
})

function showAlert(name) {
  alert(`Wasup i am ${name}`)
}

function functionDeclaration() {
  showAlert("Function Declaration")
}

const functionExpression = function () {
  showAlert("Function Expression")
}

const arrowFunction = () => {
  showAlert("Arrow Function")
}
