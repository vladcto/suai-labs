window.onload = function () {
  const generateButton = document.getElementById("generateButton")
  const controlPointsInput = document.getElementById("controlPoints")
  const errorOutput = document.getElementById("errorOutput")

  function drawGraph() {
    const numPoints = parseInt(controlPointsInput.value)
    if (isNaN(numPoints) || numPoints < 4 || numPoints > 28) {
      alert("Введите корректное число опорных точек (от 4 до 28)")
      return
    }

    const xValues = []
    const yValues = []
    for (let x = -1; x < 1.1; x += 0.01) {
      xValues.push(x)
      yValues.push(Math.asin(x))
    }

    const controlPointsX = []
    const controlPointsY = []
    for (let i = 0; i <= numPoints; i++) {
      const x = -1 + (2 / (numPoints - 1)) * i
      controlPointsX.push(x)
      controlPointsY.push(Math.asin(x))
    }
    controlPointsX.push(1)
    controlPointsY.push(Math.asin(1))
    controlPointsX.push(1)
    controlPointsY.push(Math.asin(1))

    const spline = interpolateBSpline(controlPointsX)

    const error = calculateError(xValues, yValues, spline.x, spline.y)
    errorOutput.textContent = `Среднеквадратичная ошибка интерполяции: ${error.toExponential(
      6
    )}`

    const data = [
      {
        x: xValues,
        y: yValues,
        mode: "lines",
        name: "arcsin(x)",
        line: { color: "#6200ee", width: 2 },
      },
      {
        x: spline.x,
        y: spline.y,
        mode: "lines",
        name: "Интерполяция B-сплайном",
        line: { color: "#03dac6", width: 2 },
      },
      {
        x: controlPointsX,
        y: controlPointsY,
        mode: "markers",
        name: "Опорные точки",
        marker: { color: "#ff0266", size: 8 },
      },
    ]

    const layout = {
      title: "График функции arcsin(x) и её интерполяция B-сплайном",
      xaxis: { title: "x" },
      yaxis: { title: "arcsin(x)" },
      legend: { orientation: "h", x: 0, y: -0.2 },
    }

    Plotly.newPlot("graph", data, layout)
  }

  function interpolateBSpline(xValues) {
    const splineFunc = new BSpline(xValues, Math.asin)
    const xSpline = []
    const ySpline = []
    for (let x = -1; x <= 1; x += 0.01) {
      xSpline.push(x)
      ySpline.push(splineFunc.calcAt(x))
    }
    return { x: xSpline, y: ySpline }
  }

  // Реализация B-сплайна
  class BSpline {
    constructor(x, fn) {
      this.x = x.slice(0)
      this.fn = fn
    }

    calcAt(xPredict) {
      const fn = this.fn

      let knots = findValidSubarray(this.x, xPredict)

      let p0 = fn(knots[0])
      let p1 = fn(knots[1])
      let p2 = fn(knots[2])
      let p3 = fn(knots[3])

      let t = (xPredict - knots[0]) / (knots[3] - knots[0])

      let eq1 = (1 - t) * p0 + 3 * t * p1

      return (eq1 * (1 - t) + 3 * t * t * p2) * (1 - t) + t * t * t * p3
    }
  }

  function findValidSubarray(arr, predict) {
    let res = []
    for (let i = 0; i < arr.length; i += 2) {
      let subarray = arr.slice(i, i + 4)
      while (subarray.length < 4) {
        subarray.push(subarray[subarray.length - 1])
      }
      res.push(subarray)
    }

    for (let array of res) {
      if (array[0] <= predict && predict < array[3]) {
        return array
      }
    }
    return res[res.length - 1]
  }

  function calculateError(xOriginal, yOriginal, xInterpolated, yInterpolated) {
    let errorSum = 0
    const length = Math.min(xOriginal.length, xInterpolated.length)
    for (let i = 0; i < length; i++) {
      const yOrig = yOriginal[i]
      const yInterp = yInterpolated[i]

      const dy = yOrig - yInterp
      errorSum += dy * dy
    }
    const mse = errorSum / length
    return Math.sqrt(mse)
  }

  generateButton.addEventListener("click", drawGraph)

  // Построение начального графика
  drawGraph()
}
