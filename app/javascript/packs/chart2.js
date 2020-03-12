import chart from 'chart.js'


export const lineCharts = () => {
  const ctx = document.getElementById("tester-chart");
  const myLineChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August'],
      datasets: [{
        label: 'My First dataset',
        backgroundColor: 'rgb(255, 99, 132)',
        borderColor: 'rgb(255, 99, 132)',
        data: [0, 10, 5, 2, 20, 30, 0, 0]
      }]
    }
  });
};
