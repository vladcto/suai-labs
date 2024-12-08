const express = require("express")
const bodyParser = require("body-parser")
const path = require("path")
const app = express()
const PORT = 3000

app.use(bodyParser.urlencoded({ extended: true }))
app.use(express.static(path.join(__dirname, "public")))

app.get("/", (_, res) => {
  res.sendFile(path.join(__dirname, "public", "index.html"))
})

app.post("/submit", (req, res) => {
  const formData = req.body
  const errors = validateForm(formData)

  if (errors.length > 0) {
    res.send(
      `<h1>Validation Errors</h1><ul>${errors
        .map((error) => `<li>${error}</li>`)
        .join("")}</ul>`
    )
  } else {
    const queryParams = new URLSearchParams(formData).toString()
    res.redirect(`/result.html?${queryParams}`)
  }
})

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`)
})

function validateForm(formData) {
  const errors = []
  if (!formData.name) errors.push("Name is required.")
  if (!formData.email) errors.push("Email is required.")
  if (!formData.password) errors.push("Password is required.")
  return errors
}
