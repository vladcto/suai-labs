document.addEventListener("DOMContentLoaded", () => {
  const urlParams = new URLSearchParams(window.location.search)

  document.getElementById("name").textContent = urlParams.get("name")
  document.getElementById("email").textContent = urlParams.get("email")
  document.getElementById("gender").textContent = urlParams.get("gender")
  document.getElementById("birthdate").textContent = urlParams.get("birthdate")
  document.getElementById("country").textContent = urlParams.get("country")
  document.getElementById("bio").textContent = urlParams.get("bio")
  document.getElementById("newsletter").textContent =
    urlParams.get("newsletter") === "true" ? "Subscribed" : "Not Subscribed"

  const imageSrc =
    urlParams.get("profilePicture") !== "" ? "checked.jpeg" : "unchecked.png"
  document.getElementById("subscriptionImage").src = imageSrc
})
