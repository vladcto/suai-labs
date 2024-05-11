function showSubjects() {
  const labWorks = {
    Веб: 6,
    Физра: -1,
    ТАСИ: 0,
    Мультимедия: 0,
    ИТМ: 4,
    "Домашка от Тайла Дердена": 12,
  }

  for (const [subject, count] of Object.entries(labWorks)) {
    alert(`Для предмета ${subject} сдано целых ${count} лаб.`)
  }
}

function changeTextAndColor(block) {
  const getRandomElement = (list) =>
    list[Math.floor(Math.random() * list.length)]

  const messages = ["Не кликай", ">:(", "...", "Не надо...", "Ты чево :("]

  const colors = ["#f56565", "#45aaf2", "#43d0ad", "#f7b84b", "#9c88ff"]

  block.textContent = getRandomElement(messages)
  block.style.backgroundColor = getRandomElement(colors)
}
