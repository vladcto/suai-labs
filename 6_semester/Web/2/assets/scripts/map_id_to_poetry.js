const pathElementMap = {
	'assets/poetry/dulo.txt': 'dulo',
	'assets/poetry/nominalo.txt': 'nominalo',
	'assets/poetry/omg.txt': 'omg',
	'assets/poetry/omg2.txt': 'omg2',
	'assets/poetry/spb.txt': 'spb',
	'assets/poetry/prank.txt': 'prank',
};

for (const [path, elementId] of Object.entries(pathElementMap)) {
	fetch(path)
		.then(response => response.text())
		.then(data => {
			document.getElementById(elementId).innerHTML
				= `<pre>${data}</pre>`;
		});
}