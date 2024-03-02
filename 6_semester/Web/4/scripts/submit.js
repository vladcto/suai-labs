document.getElementById('booking-form').addEventListener('submit', function (event) {
	const name = document.querySelector('input[name="name"]').value;
	const comments = document.querySelector('textarea[name="comments"]').value;
	const password = document.querySelector('input[name="password"]').value;
	const roomType = document.querySelector('input[name="room-type"]:checked').value;
	const breakfast = document.querySelector('input[name="breakfast"]').checked;
	const lunch = document.querySelector('input[name="lunch"]').checked;
	const date = document.querySelector('input[name="date"]').value;

	console.log('Name:', name);
	console.log('Comments:', comments);
	console.log('Password:', password);
	console.log('Room type:', roomType);
	console.log('Breakfast:', breakfast);
	console.log('Lunch:', lunch);
	console.log('Date:', date);

	event.preventDefault();
});
