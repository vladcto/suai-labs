document.addEventListener("DOMContentLoaded", function () {
  console.log("Учебное пособие по географии загружено")

  // Загрузка навигации в сайдбар
  fetch("navigation.html")
    .then((response) => response.text())
    .then((data) => {
      document.getElementById("sidebar-container").innerHTML = data
    })
    .catch((error) => console.error("Ошибка загрузки навигации:", error))

  // Инициализация обработчиков для заданий с перетаскиванием (для всех draggable и droppable элементов)
  const draggables = document.querySelectorAll(".draggable")
  draggables.forEach((draggable) => {
    draggable.addEventListener("dragstart", dragStart)
  })

  const droppables = document.querySelectorAll(".droppable")
  droppables.forEach((droppable) => {
    droppable.addEventListener("dragover", dragOver)
    droppable.addEventListener("drop", dropItem)
  })

  // Инициализация обработчиков для сортируемого списка континентов
  addDnDHandlers()
})

// Обновлённая функция dragStart для поддержки разных типов (столица или климат)
function dragStart(event) {
  // Если есть data-capital, используем его; иначе, data-climate
  const value = event.target.dataset.capital || event.target.dataset.climate
  event.dataTransfer.setData("text/plain", value)
  event.dataTransfer.effectAllowed = "move"
}

// Универсальная функция для обработки события dragover
function dragOver(event) {
  event.preventDefault()
  event.dataTransfer.dropEffect = "move"
}

// Универсальная функция для обработки drop (для заданий "столица-страна" и "климат")
function dropItem(event) {
  event.preventDefault()
  const data = event.dataTransfer.getData("text/plain")

  // Определяем ближайший элемент с классом "droppable"
  let dropTarget = event.target
  while (
    !dropTarget.classList.contains("droppable") &&
    dropTarget !== document.body
  ) {
    dropTarget = dropTarget.parentElement
  }
  if (!dropTarget.classList.contains("droppable")) return

  // Если это область для "столица-страна"
  if (dropTarget.hasAttribute("data-country")) {
    let span = dropTarget.querySelector(".assigned-capital")
    if (!span) {
      span = document.createElement("span")
      span.className = "assigned-capital"
      dropTarget.appendChild(span)
    }
    span.textContent = " - " + data
    dropTarget.dataset.assignedCapital = data
  }
  // Если это область для "климат"
  else if (dropTarget.hasAttribute("data-region")) {
    let span = dropTarget.querySelector(".assigned-climate")
    if (!span) {
      span = document.createElement("span")
      span.className = "assigned-climate"
      dropTarget.appendChild(span)
    }
    span.textContent = " - " + data
    dropTarget.dataset.assignedClimate = data
  }
}

// Функция проверки задания "Соотнесите столицу с ее страной"
function checkMatching() {
  const droppables = document.querySelectorAll(".droppable[data-country]")
  let score = 0
  droppables.forEach((droppable) => {
    const country = droppable.dataset.country
    const assigned = droppable.dataset.assignedCapital
    if (country === "Россия" && assigned === "Москва") score++
    else if (country === "Франция" && assigned === "Париж") score++
    else if (country === "США" && assigned === "Вашингтон") score++
    else if (country === "Великобритания" && assigned === "Лондон") score++
    else if (country === "Япония" && assigned === "Токио") score++
  })
  const feedback = document.getElementById("matching-feedback")
  if (score === droppables.length) {
    feedback.textContent = "Поздравляем! Все столицы сопоставлены правильно."
    feedback.style.color = "green"
  } else {
    feedback.textContent = `Вы сопоставили правильно ${score} из ${droppables.length} пар. Попробуйте еще раз.`
    feedback.style.color = "red"
  }
}

/* --------------- Задание 2: Расставьте континенты по площади --------------- */

let dragSrcEl = null

function handleDragStart(e) {
  dragSrcEl = this
  e.dataTransfer.effectAllowed = "move"
  e.dataTransfer.setData("text/html", this.innerHTML)
  this.classList.add("dragging")
}

function handleDragOver(e) {
  if (e.preventDefault) {
    e.preventDefault()
  }
  e.dataTransfer.dropEffect = "move"
  return false
}

function handleDragEnter(e) {
  this.classList.add("over")
}

function handleDragLeave(e) {
  this.classList.remove("over")
}

function handleDrop(e) {
  if (e.stopPropagation) {
    e.stopPropagation()
  }
  if (dragSrcEl !== this) {
    // Меняем местами содержимое элементов и их data-атрибуты
    let temp = dragSrcEl.innerHTML
    dragSrcEl.innerHTML = this.innerHTML
    this.innerHTML = temp

    let tempData = dragSrcEl.getAttribute("data-continent")
    dragSrcEl.setAttribute(
      "data-continent",
      this.getAttribute("data-continent")
    )
    this.setAttribute("data-continent", tempData)
  }
  return false
}

function handleDragEnd(e) {
  let items = document.querySelectorAll("#continent-list .sortable")
  items.forEach(function (item) {
    item.classList.remove("over")
    item.classList.remove("dragging")
  })
}

function addDnDHandlers() {
  let items = document.querySelectorAll("#continent-list .sortable")
  items.forEach(function (item) {
    item.addEventListener("dragstart", handleDragStart, false)
    item.addEventListener("dragenter", handleDragEnter, false)
    item.addEventListener("dragover", handleDragOver, false)
    item.addEventListener("dragleave", handleDragLeave, false)
    item.addEventListener("drop", handleDrop, false)
    item.addEventListener("dragend", handleDragEnd, false)
  })
}

// Функция проверки порядка континентов
function checkOrder() {
  // Правильный порядок по площади (от наименьшей к наибольшей):
  // Australia, Europe, Antarctica, South America, North America, Africa, Asia
  const correctOrder = [
    "Australia",
    "Europe",
    "Antarctica",
    "South America",
    "North America",
    "Africa",
    "Asia",
  ]
  const items = document.querySelectorAll("#continent-list .sortable")
  let score = 0
  items.forEach(function (item, index) {
    if (item.getAttribute("data-continent") === correctOrder[index]) {
      score++
    }
  })
  const feedback = document.getElementById("order-feedback")
  if (score === correctOrder.length) {
    feedback.textContent = "Поздравляем! Вы расставили континенты правильно."
    feedback.style.color = "green"
  } else {
    feedback.textContent = `Вы расставили правильно ${score} из ${correctOrder.length} континентов. Попробуйте еще раз.`
    feedback.style.color = "red"
  }
}

/* --------------- Задание 3: Определите климатическую зону --------------- */

// Функция проверки задания "Определите климатическую зону"
function checkClimateMatching() {
  // Определим правильное соответствие:
  // "Саванна"  → "Тропический"
  // "Умеренная зона" → "Умеренный"
  // "Арктика"  → "Полярный"
  const correctMapping = {
    Саванна: "Тропический",
    "Умеренная зона": "Умеренный",
    Арктика: "Полярный",
  }

  const droppables = document.querySelectorAll(".droppable[data-region]")
  let score = 0
  droppables.forEach((droppable) => {
    let region = droppable.dataset.region
    let assigned = droppable.dataset.assignedClimate
    if (assigned === correctMapping[region]) {
      score++
    }
  })
  const feedback = document.getElementById("climate-feedback")
  if (score === Object.keys(correctMapping).length) {
    feedback.textContent =
      "Поздравляем! Вы правильно определили климатические зоны."
    feedback.style.color = "green"
  } else {
    feedback.textContent = `Вы правильно определили климат для ${score} из ${
      Object.keys(correctMapping).length
    } регионов. Попробуйте еще раз.`
    feedback.style.color = "red"
  }
}

// Функция проверки вопроса 1: Океан
function checkTest1() {
  const form = document.getElementById("test1")
  const feedback = document.getElementById("test1-feedback")
  const selected = form.ocean.value
  if (selected === "Pacific") {
    feedback.textContent = "Правильно! Тихий океан является самым большим."
    feedback.style.color = "green"
  } else {
    feedback.textContent = "Неправильно. Попробуйте еще раз."
    feedback.style.color = "red"
  }
}

// Функция проверки вопроса 2: Континент по площади
function checkTest2() {
  const form = document.getElementById("test2")
  const feedback = document.getElementById("test2-feedback")
  const selected = form.continent.value
  if (selected === "Asia") {
    feedback.textContent = "Правильно! Азия занимает наибольшую площадь."
    feedback.style.color = "green"
  } else {
    feedback.textContent = "Неправильно. Попробуйте еще раз."
    feedback.style.color = "red"
  }
}

// Функция проверки вопроса 3: Климат саванн
function checkTest3() {
  const form = document.getElementById("test3")
  const feedback = document.getElementById("test3-feedback")
  const selected = form.climate.value
  if (selected === "Тропический") {
    feedback.textContent = "Правильно! Саванны характерны тропическим климатом."
    feedback.style.color = "green"
  } else {
    feedback.textContent = "Неправильно. Попробуйте еще раз."
    feedback.style.color = "red"
  }
}

// Функция проверки вопроса 4: Самая длинная река
function checkTest4() {
  const form = document.getElementById("test4")
  const feedback = document.getElementById("test4-feedback")
  const selected = form.river.value
  if (selected === "Nile") {
    feedback.textContent = "Правильно! Нил считается самой длинной рекой."
    feedback.style.color = "green"
  } else {
    feedback.textContent = "Неправильно. Попробуйте еще раз."
    feedback.style.color = "red"
  }
}

// Функция проверки вопроса 5: Полярная климатическая зона
function checkTest5() {
  const form = document.getElementById("test5")
  const feedback = document.getElementById("test5-feedback")
  const selected = form.region.value
  if (selected === "Arctic") {
    feedback.textContent =
      "Правильно! Арктика относится к полярной климатической зоне."
    feedback.style.color = "green"
  } else {
    feedback.textContent = "Неправильно. Попробуйте еще раз."
    feedback.style.color = "red"
  }
}

document.addEventListener("DOMContentLoaded", function () {
  var arabText = document.getElementById("arabLink")

  arabText.addEventListener("click", function () {
    alert(
        '- Этимология: Слово "арабы" происходит из древних семитских языков.\n' +
        "- История: Арабы сыграли важную роль в истории Ближнего Востока, оказали влияние на развитие науки, философии и искусства.\n" +
        "- Культура: Арабская культура известна своим вкладом в литературу, музыку, архитектуру и кулинарию.\n" +
        "- География: Арабы проживают на Ближнем Востоке и в Северной Африке, однако их диаспора существует по всему миру."
    )
  })
})
