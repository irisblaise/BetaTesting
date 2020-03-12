import chart from 'chart.js'


export const lineCharts = () => {
  const ctx = document.querySelector("#tester-chart");
  const months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
  ]

  const buildDataSet = (dataByMonth, monthsToDate) => {
    const currentYear = new Date().getFullYear()
    const data = []

    for(let i = 1; i < monthsToDate + 1; i++) {
      let currentKey = `${i}_${currentYear}`
      data.push(dataByMonth[currentKey] ? dataByMonth[currentKey] : 0)
    }

    return data;
  }

  if (ctx) {
    let data = JSON.parse(ctx.dataset.data);

    const monthsToDate = months.slice(0, new Date().getMonth() + 1)

    const dataset = buildDataSet(data, monthsToDate.length)

    const myLineChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: monthsToDate,
        datasets: [{
          label: 'Number of tests',
          backgroundColor: 'rgb(255, 99, 132)',
          borderColor: 'rgb(255, 99, 132)',
          data: dataset
        }]
      },
        options: {
          scales: {
            yAxes: [{
              display: true,
              ticks: {
                  suggestedMin: 0,    // minimum will be 0, unless there is a lower value.
                  beginAtZero: true,
                  suggestedMax: 10,
                  stepSize: 1
                }
              }]
            }
          }
      });
  }
};
