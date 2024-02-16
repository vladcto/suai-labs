function toSpongeBobCase(str) {
	return str.split('').map((char, index) => {
		return index % 3 !== 0 ? char.toUpperCase() : char.toLowerCase();
	}).join('');
}

var id = 'bob';
document.getElementById(id).innerText =
	toSpongeBobCase(document.getElementById(id).innerText);