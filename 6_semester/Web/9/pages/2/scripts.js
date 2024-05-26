$(document).ready(function() {
	var ctx = document.getElementById('myChart').getContext('2d');
	new Chart(ctx, {
	  type: 'bar',
	  data: {
		labels: ['СПБ', 'Москва', 'Лондон', 'Сланцы', 'Суздаль'],
		datasets: [{
		  label: 'Города-миллионники',
		  data: [2, 3, 6, 20, 200],
		  backgroundColor: [
			'rgba(255, 99, 132, 0.2)',
			'rgba(54, 162, 235, 0.2)',
			'rgba(255, 206, 86, 0.2)',
			'rgba(75, 192, 192, 0.2)',
			'rgba(153, 102, 255, 0.2)'
		  ],
		  borderColor: [
			'rgba(255, 99, 132, 1)',
			'rgba(54, 162, 235, 1)',
			'rgba(255, 206, 86, 1)',
			'rgba(75, 192, 192, 1)',
			'rgba(153, 102, 255, 1)'
		  ],
		  borderWidth: 1
		}]
	  },
	  options: {
		scales: {
		  y: {
			beginAtZero: true,
			title: {
			  display: true,
			  text: 'Жители в млн'
			}
		  },
		  x: {
			title: {
			  display: true,
			  text: 'Город'
			}
		  }
		}
	  }
	});
  });
  