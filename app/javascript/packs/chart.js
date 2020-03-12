import chart from 'chart.js'

// Bar chart
const colors = {
  website_ux: 'rgba(255, 99, 132, 0.2)',
  website_ui: 'rgba(54, 162, 235, 0.2)',
  website_latency: 'rgba(255, 206, 86, 0.2)',
  website_fluidity: 'rgba(75, 192, 192, 0.2)',
  website_design: 'rgba(153, 102, 255, 0.2)'
}

const border_colors = {
  website_ux: 'rgba(255, 99, 132, 1)',
  website_ui: 'rgba(54, 162, 235, 1)',
  website_latency: 'rgba(255, 206, 86, 1)',
  website_fluidity: 'rgba(75, 192, 192, 1)',
  website_design: 'rgba(153, 102, 255, 1)'
}

const formatDataSet = (data) => {
  // data = [{ website_ux: 1, website_ui: 1}, { website_ux: 2, website_uid: 2}]

  // isolate the keys -> ['website_ux', 'website_ui']
  const keys = Object.keys(data[0])

  // create an empty object to push data to
  const datasets = {}

  // for each key
  keys.forEach(key => {
    // create a new property -> { website_ux: null }
    //
    datasets[key] = data.map(d => d[key])
  })

  return Object.keys(datasets).map(key => {
    return {
      label: key,
      backgroundColor: colors[key],
      borderColor: border_colors[key],
      borderWidth: 1,
      data: datasets[key]
    }
  })
}

const charts = () => {
  const ctx = document.getElementById("myChart");

  if (ctx) {
    const labels = JSON.parse(ctx.dataset.labels);
    let data = JSON.parse(ctx.dataset.data);


    const dataset = formatDataSet(data)
    const mixedChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels,
        datasets: dataset
      },
      options: {
        scales: {
          yAxes: [{
              display: true,
              ticks: {
                  suggestedMin: 0,    // minimum will be 0, unless there is a lower value.
                  beginAtZero: true,
                  suggestedMax: 5,   // minimum value will be 0.
              }
          }]
        }
      }
    });
  }
}

export { charts }
