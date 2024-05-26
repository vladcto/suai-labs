function beat1() {
  $(".animate-box").animate(
    {
      fontSize: "200px",
    },
    {
      duration: 300,
      easing: "easeOutSine",
      complete: beat2,
    }
  )
}

function beat2() {
  $(".animate-box").animate(
    {
      fontSize: "225px",
    },
    {
      duration: 300,
      easing: "easeInSine",
      complete: pause,
    }
  )
}

function pause() {
  $(".animate-box").delay(500).animate(
    {
      fontSize: "250px",
    },
    {
      duration: 300,
      easing: "easeOutSine",
      complete: beat3,
    }
  )
}

function beat3() {
  $(".animate-box").animate(
    {
      fontSize: "200px",
    },
    {
      duration: 300,
      easing: "easeOutSine",
      complete: beat4,
    }
  )
}

function beat4() {
  $(".animate-box").animate(
    {
      fontSize: "225px",
    },
    {
      duration: 300,
      easing: "easeInSine",
      complete: beat1,
    }
  )
}

$(document).ready(function () {
  beat1()
})
