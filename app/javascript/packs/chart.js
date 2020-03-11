import chart from 'chart.js'

// Bar chart
const colors = {
  website_ux: 'blue',
  website_ui: 'red',
  website_latency: 'pink',
  website_fluidity: 'yellow',
  website_design: 'green'
}

const formatDataSet = (data) => {
  // data = [{ website_ux: 1, website_ui: 1}, { website_ux: 2, website_uid: 2}]

  // isolate the keys -> ['website_ux', 'website_ui']
  const keys = Object.keys(data[0])

  // create an empty object to push data to
  const dataset = {}

  // for each key
  keys.forEach(key => {
    // create a new property -> { website_ux: null }
    //
    dataset[key] = data.map(d => d[key])
  })

  return Object.keys(dataset).map(key => {
    return {
      label: key,
      backgroundColor: colors[key],
      data: dataset[key]
    }
  })
}

const charts = () => {
  const ctx = document.getElementById("myChart");

  if (ctx) {
    const labels = JSON.parse(ctx.dataset.labels);
    let data = JSON.parse(ctx.dataset.data);

    data = data.map(d => JSON.parse(d))

    const datasets = formatDataSet(data)

    const mixedChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels,
        datasets
      }
    });
  }
}

export { charts }
