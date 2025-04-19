document.addEventListener("DOMContentLoaded", function () {
	// Инициализация drag & drop для всех draggable элементов
	const draggables = document.querySelectorAll(".draggable");
	draggables.forEach(draggable => {
	  draggable.addEventListener("dragstart", dragStart);
	});
  
	const droppables = document.querySelectorAll(".droppable");
	droppables.forEach(droppable => {
	  droppable.addEventListener("dragover", dragOver);
	  droppable.addEventListener("drop", dropItem);
	});
  
	// Инициализация обработчиков для сортируемого списка континентов
	addDnDHandlers();
  });
  
  // Функция dragStart для столиц или климатов
  function dragStart(event) {
	const value = event.target.dataset.capital || event.target.dataset.climate;
	event.dataTransfer.setData("text/plain", value);
	event.dataTransfer.effectAllowed = "move";
  }
  
  // Функция dragOver
  function dragOver(event) {
	event.preventDefault();
	event.dataTransfer.dropEffect = "move";
  }
  
  // Функция dropItem для обработки перетаскивания
  function dropItem(event) {
	event.preventDefault();
	const data = event.dataTransfer.getData("text/plain");
	
	let dropTarget = event.target;
	while (!dropTarget.classList.contains("droppable") && dropTarget !== document.body) {
	  dropTarget = dropTarget.parentElement;
	}
	if (!dropTarget.classList.contains("droppable")) return;
	
	if (dropTarget.hasAttribute("data-country")) {
	  let span = dropTarget.querySelector(".assigned-capital");
	  if (!span) {
		span = document.createElement("span");
		span.className = "assigned-capital";
		dropTarget.appendChild(span);
	  }
	  span.textContent = " - " + data;
	  dropTarget.dataset.assignedCapital = data;
	} else if (dropTarget.hasAttribute("data-region")) {
	  let span = dropTarget.querySelector(".assigned-climate");
	  if (!span) {
		span = document.createElement("span");
		span.className = "assigned-climate";
		dropTarget.appendChild(span);
	  }
	  span.textContent = " - " + data;
	  dropTarget.dataset.assignedClimate = data;
	}
  }
  
  // Задание 1: Проверка сопоставления столиц
  function checkMatching() {
	const droppables = document.querySelectorAll(".droppable[data-country]");
	let score = 0;
	droppables.forEach(droppable => {
	  const country = droppable.dataset.country;
	  const assigned = droppable.dataset.assignedCapital;
	  if ((country === "Россия" && assigned === "Москва") ||
		  (country === "Франция" && assigned === "Париж") ||
		  (country === "США" && assigned === "Вашингтон") ||
		  (country === "Великобритания" && assigned === "Лондон") ||
		  (country === "Япония" && assigned === "Токио")) {
		score++;
	  }
	});
	const feedback = document.getElementById("matching-feedback");
	if (score === droppables.length) {
	  feedback.textContent = "Поздравляем! Все столицы сопоставлены правильно.";
	  feedback.style.color = "green";
	} else {
	  feedback.textContent = `Вы сопоставили правильно ${score} из ${droppables.length} пар. Попробуйте еще раз.`;
	  feedback.style.color = "red";
	}
  }
  
  /* Задание 2: Расстановка континентов по площади */
  
  let dragSrcEl = null;
  
  function handleDragStart(e) {
	dragSrcEl = this;
	e.dataTransfer.effectAllowed = "move";
	e.dataTransfer.setData("text/html", this.innerHTML);
	this.classList.add("dragging");
  }
  
  function handleDragOver(e) {
	if (e.preventDefault) e.preventDefault();
	e.dataTransfer.dropEffect = "move";
	return false;
  }
  
  function handleDragEnter(e) {
	this.classList.add("over");
  }
  
  function handleDragLeave(e) {
	this.classList.remove("over");
  }
  
  function handleDrop(e) {
	if (e.stopPropagation) e.stopPropagation();
	if (dragSrcEl !== this) {
	  let temp = dragSrcEl.innerHTML;
	  dragSrcEl.innerHTML = this.innerHTML;
	  this.innerHTML = temp;
	  let tempData = dragSrcEl.getAttribute("data-continent");
	  dragSrcEl.setAttribute("data-continent", this.getAttribute("data-continent"));
	  this.setAttribute("data-continent", tempData);
	}
	return false;
  }
  
  function handleDragEnd(e) {
	const items = document.querySelectorAll("#continent-list .sortable");
	items.forEach(item => {
	  item.classList.remove("over");
	  item.classList.remove("dragging");
	});
  }
  
  function addDnDHandlers() {
	const items = document.querySelectorAll("#continent-list .sortable");
	items.forEach(item => {
	  item.addEventListener("dragstart", handleDragStart, false);
	  item.addEventListener("dragenter", handleDragEnter, false);
	  item.addEventListener("dragover", handleDragOver, false);
	  item.addEventListener("dragleave", handleDragLeave, false);
	  item.addEventListener("drop", handleDrop, false);
	  item.addEventListener("dragend", handleDragEnd, false);
	});
  }
  
  // Задание 2: Проверка порядка континентов
  function checkOrder() {
	const correctOrder = ["Australia", "Europe", "Antarctica", "South America", "North America", "Africa", "Asia"];
	const items = document.querySelectorAll("#continent-list .sortable");
	let score = 0;
	items.forEach((item, index) => {
	  if (item.getAttribute("data-continent") === correctOrder[index]) {
		score++;
	  }
	});
	const feedback = document.getElementById("order-feedback");
	if (score === correctOrder.length) {
	  feedback.textContent = "Поздравляем! Вы расставили континенты правильно.";
	  feedback.style.color = "green";
	} else {
	  feedback.textContent = `Вы расставили правильно ${score} из ${correctOrder.length} континентов. Попробуйте еще раз.`;
	  feedback.style.color = "red";
	}
  }
  
  /* Задание 3: Определение климатической зоны */
  
  function checkClimateMatching() {
	const correctMapping = {
	  "Саванна": "Тропический",
	  "Умеренная зона": "Умеренный",
	  "Арктика": "Полярный"
	};
  
	const droppables = document.querySelectorAll(".droppable[data-region]");
	let score = 0;
	droppables.forEach(droppable => {
	  let region = droppable.dataset.region;
	  let assigned = droppable.dataset.assignedClimate;
	  if (assigned === correctMapping[region]) {
		score++;
	  }
	});
	const feedback = document.getElementById("climate-feedback");
	if (score === Object.keys(correctMapping).length) {
	  feedback.textContent = "Поздравляем! Вы правильно определили климатические зоны.";
	  feedback.style.color = "green";
	} else {
	  feedback.textContent = `Вы правильно определили климат для ${score} из ${Object.keys(correctMapping).length} регионов. Попробуйте еще раз.`;
	  feedback.style.color = "red";
	}
  }
  