// Пример функций проверки для вопросов (функции возвращают 1 за правильный ответ, 0 за неправильный)

// Вопрос 1
function checkTest1() {
  const form = document.getElementById("test1")
  const feedback = document.getElementById("test1-feedback")
  const selected = form.ocean.value
  if (selected === "Pacific") {
    feedback.textContent = "Правильно! Тихий океан является самым большим."
    feedback.style.color = "green"
    return 1
  } else {
    feedback.textContent = "Неправильно."
    feedback.style.color = "red"
    return 0
  }
}

// Вопрос 2
function checkTest2() {
  const form = document.getElementById("test2")
  const feedback = document.getElementById("test2-feedback")
  const selected = form.continent.value
  if (selected === "Asia") {
    feedback.textContent = "Правильно! Азия занимает наибольшую площадь."
    feedback.style.color = "green"
    return 1
  } else {
    feedback.textContent = "Неправильно."
    feedback.style.color = "red"
    return 0
  }
}

// Вопрос 3
function checkTest3() {
  const form = document.getElementById("test3")
  const feedback = document.getElementById("test3-feedback")
  const selected = form.climate.value
  if (selected === "Тропический") {
    feedback.textContent = "Правильно! Саванны характерны тропическим климатом."
    feedback.style.color = "green"
    return 1
  } else {
    feedback.textContent = "Неправильно."
    feedback.style.color = "red"
    return 0
  }
}

// Вопрос 4
function checkTest4() {
  const form = document.getElementById("test4")
  const feedback = document.getElementById("test4-feedback")
  const selected = form.river.value
  if (selected === "Nile") {
    feedback.textContent = "Правильно! Нил считается самой длинной рекой."
    feedback.style.color = "green"
    return 1
  } else {
    feedback.textContent = "Неправильно."
    feedback.style.color = "red"
    return 0
  }
}

// Вопрос 5
function checkTest5() {
  const form = document.getElementById("test5")
  const feedback = document.getElementById("test5-feedback")
  const selected = form.region.value
  if (selected === "Arctic") {
    feedback.textContent =
      "Правильно! Арктика относится к полярной климатической зоне."
    feedback.style.color = "green"
    return 1
  } else {
    feedback.textContent = "Неправильно."
    feedback.style.color = "red"
    return 0
  }
}

// Вопрос 6
function checkTest6() {
  const form = document.getElementById("test6")
  const feedback = document.getElementById("test6-feedback")
  const selected = form.geography.value
  if (selected === "PhysicalSocial") {
    feedback.textContent =
      "Правильно! География изучает физические и социальные процессы."
    feedback.style.color = "green"
    return 1
  } else {
    feedback.textContent = "Неправильно."
    feedback.style.color = "red"
    return 0
  }
}

// Вопрос 7
function checkTest7() {
  const form = document.getElementById("test7")
  const feedback = document.getElementById("test7-feedback")
  const selected = form.globe.value
  if (selected === "Модель") {
    feedback.textContent = "Правильно! Глобус – это модель Земли."
    feedback.style.color = "green"
    return 1
  } else {
    feedback.textContent = "Неправильно."
    feedback.style.color = "red"
    return 0
  }
}

// Вопрос 8
function checkTest8() {
  const form = document.getElementById("test8")
  const feedback = document.getElementById("test8-feedback")
  const selected = form.smallContinent.value
  if (selected === "Австралия") {
    feedback.textContent = "Правильно! Австралия – самый маленький континент."
    feedback.style.color = "green"
    return 1
  } else {
    feedback.textContent = "Неправильно."
    feedback.style.color = "red"
    return 0
  }
}

// Вопрос 9
function checkTest9() {
  const form = document.getElementById("test9")
  const feedback = document.getElementById("test9-feedback")
  const selected = form.deepOcean.value
  if (selected === "Тихий") {
    feedback.textContent = "Правильно! Тихий океан является самым глубоким."
    feedback.style.color = "green"
    return 1
  } else {
    feedback.textContent = "Неправильно."
    feedback.style.color = "red"
    return 0
  }
}

// Вопрос 10
function checkTest10() {
  const form = document.getElementById("test10")
  const feedback = document.getElementById("test10-feedback")
  const selected = form.resource.value
  if (selected === "Нефть") {
    feedback.textContent =
      "Правильно! Нефть не относится к возобновляемым ресурсам."
    feedback.style.color = "green"
    return 1
  } else {
    feedback.textContent = "Неправильно."
    feedback.style.color = "red"
    return 0
  }
}

// Вопрос 11
function checkTest11() {
  const form = document.getElementById("test11")
  const feedback = document.getElementById("test11-feedback")
  const selected = form.population.value
  if (selected === "Демографическое") {
    feedback.textContent =
      "Правильно! Демографическое исследование помогает понять распределение населения."
    feedback.style.color = "green"
    return 1
  } else {
    feedback.textContent = "Неправильно."
    feedback.style.color = "red"
    return 0
  }
}

// Вопрос 12
function checkTest12() {
  const form = document.getElementById("test12")
  const feedback = document.getElementById("test12-feedback")
  const selected = form.environment.value
  if (selected === "Экология") {
    feedback.textContent =
      "Правильно! Экология изучает взаимодействие человека и окружающей среды."
    feedback.style.color = "green"
    return 1
  } else {
    feedback.textContent = "Неправильно."
    feedback.style.color = "red"
    return 0
  }
}

// Вопрос 13
function checkTest13() {
  const form = document.getElementById("test13")
  const feedback = document.getElementById("test13-feedback")
  const selected = form.projection.value
  if (selected === "Проекция") {
    feedback.textContent =
      "Правильно! Проекция – это метод отображения земной поверхности на плоской карте."
    feedback.style.color = "green"
    return 1
  } else {
    feedback.textContent = "Неправильно."
    feedback.style.color = "red"
    return 0
  }
}

// Вопрос 14
function checkTest14() {
  const form = document.getElementById("test14")
  const feedback = document.getElementById("test14-feedback")
  const selected = form.twoContinents.value
  if (selected === "Турция") {
    feedback.textContent = "Правильно! Турция расположена на двух континентах."
    feedback.style.color = "green"
    return 1
  } else {
    feedback.textContent = "Неправильно."
    feedback.style.color = "red"
    return 0
  }
}

// Вопрос 15
function checkTest15() {
  const form = document.getElementById("test15")
  const feedback = document.getElementById("test15-feedback")
  const selected = form.climateFactor.value
  if (selected === "Плотность") {
    feedback.textContent = "Правильно! Плотность населения не влияет на климат."
    feedback.style.color = "green"
    return 1
  } else {
    feedback.innerHTML = "<a href='continents.html#targetAnchor' style='color: red;'>Неправильно. Попробуйте еще раз.</a>";
    return 0
  }
}

// Функция проверки общего балла, которая вызывает все функции проверки
function checkOverallScore() {
  const totalScore =
    checkTest1() +
    checkTest2() +
    checkTest3() +
    checkTest4() +
    checkTest5() +
    checkTest6() +
    checkTest7() +
    checkTest8() +
    checkTest9() +
    checkTest10() +
    checkTest11() +
    checkTest12() +
    checkTest13() +
    checkTest14() +
    checkTest15()
  document.getElementById("score-value").textContent = totalScore
}